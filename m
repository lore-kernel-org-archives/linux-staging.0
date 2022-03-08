Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7BA2F2B
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 20:56:35 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e13so201336plh.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 12:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sHi12oEm3E/t24MftHPPCsXxHeW61kYnNhOf+LhGIw=;
        b=NBNukXaJNcFM/m+tUQZ44Qy4Lwop0t+AdSS8pIf0xIrsXiUXfd/lK2cJstpEhpOBSr
         ekpVb2aPAbopDU+K1F96kCw8Nw0CzFHh9d0aP0IKx1D+3yvpQBaTIIlkECBZ9eLJHWg2
         bb/n3kddV3AhUsjjeq9NtFBXA4teBqD7NkCi7ts3L3IE459WTSETgWgUED+2XfZBWVPO
         NAKS/JttaKZ20Y5zCqcWDCWD7h06/y5stkanP+2g5gSoARtJklGSsPfGqIhiOlyGnkjA
         C2Qw1gYDbtdY2XW1st8WIIzcTPUkMVhFo3RVDNblxL+I3INAnuFsICxqZriS5JG7Rpt5
         Vbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sHi12oEm3E/t24MftHPPCsXxHeW61kYnNhOf+LhGIw=;
        b=vljdkcPSfsO+0uI+dgFeGkCngN+9y7eJhVzVyLecBj7NlrEUpTCIc0SaijPzXb1jHz
         VadHOVsYzLl2duXPr3Thw/9V2E6HdU6MLsfoGFTQ43WsKVorNUSg4o79Z5WABa/7jXzh
         x+5tf/8/UU1qKgP/25H3nCrTJyNeOS+/Oj1zzLce3grdO1t/AWH3toM0ss/mDSXxBwvd
         xQNnyWxilMQDL3c5HKrvlejIGXe4kQgIezznV58JCblWoxbVJbV4tEYLrfBReMLSl2XI
         1arYmKA+h+x4WD2ayg7hEeHbk/e4c9LCyEfZmqOnXA6bC0O4qyJlaJIJlNKXfKDq4+yZ
         xH4Q==
X-Gm-Message-State: AOAM5325qpP+40toN0LMMiUseJ5j1wzNJW5UWxtUQB/DiV8EPaty2vyy
	djcVnEJqDxExE9xIe6wBO4MmfaLgPt47yg==
X-Google-Smtp-Source: ABdhPJy8Nqf48NfshCenKmm4eTMb8NfChK4bTOYYuiGTSDoXdFluZEwAeZkSo6QOFCZ4vRL6Lc7Aiw==
X-Received: by 2002:a17:902:f712:b0:149:d41a:baa8 with SMTP id h18-20020a170902f71200b00149d41abaa8mr19248230plo.115.1646772995019;
        Tue, 08 Mar 2022 12:56:35 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id u10-20020a056a00124a00b004f741eb11d0sm1252661pfi.149.2022.03.08.12.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 12:56:34 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: call _cancel_timer_ex from _rtw_free_recv_priv
Date: Wed,  9 Mar 2022 02:25:09 +0530
Message-Id: <20220308205510.48431-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308205510.48431-1-makvihas@gmail.com>
References: <20220308205510.48431-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _rtw_init_recv_priv() initializes precvpriv->signal_stat_timer and
sets it's timeout interval to 1000 ms. But _rtw_free_recv_priv()
doesn't cancel the timer and we need to explicitly call
_cancel_timer_ex() after we call _rtw_free_recv_priv() to cancel the
timer.
Call _cancel_timer_ex() from inside _rtw_free_recv_priv() as every init
function needs a matching free function.


Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index d77d98351..61308eb39 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -103,6 +103,7 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 	vfree(precvpriv->pallocated_frame_buf);
 
 	rtl8188eu_free_recv_priv(padapter);
+	_cancel_timer_ex(&precvpriv->signal_stat_timer);
 }
 
 struct recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
-- 
2.30.2

