Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E080B5127
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 20:51:05 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id cx5so3414398pjb.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Mar 2022 12:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7ahohIKmaArLsCJPY4+ge/uAdlyV8nk9IujiHAfW4A=;
        b=dmx141/GaSwrAzPKb7RZU3g4+h4hKWDiNc1E0s+U+jcE0N6ksCS04dQ4rlmPxIO/5V
         dhPm7Ko+x7UwH1dbWIS3/MQ4bjp3VSbbLXLcrtlqzK4oDVRS17inl4YICiXfqhtEogkz
         HNyqE8epSgs4VOc7m94SD+Nt5Z355lfRy37SmyRP4vD9NlQ0ydqFOtUpzS9cbPfkfrP5
         2BZs2OagDmRI3Z6UKxlcanEozUTh1NFL5a/ZrUoP+4coOECMJpriRgak2n6dGbyEj8+5
         zl+RcctSjyCRXP4ghxcdqRV2v/KIUSuwk/QyH2JrMf9ZZHAOWmOPnpvD9Kh82Uezbjtr
         JcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7ahohIKmaArLsCJPY4+ge/uAdlyV8nk9IujiHAfW4A=;
        b=BeFzf037r9B4chYQb6iLwlg4qHq1b9e9BOdCBpZaBoMr1F0xfbMLWlJB/6OKquXu6f
         k+voVf18PXcDEJqWtRLndigMih7rKkpjJKCJKGQNzN/v1h/b3YTy3/QgYhwkqv1kaqXn
         yjrWyrHteJ2heauVgf/SZqLJtiTMokaveHTPo89M/XAl0eWeRbjV/c5PFISUzEL6jtfV
         Mo95KQtAcdkvgrqaLlepjMSHr1sMyrlRJjYdwmVqexXwezYtqPTTOPqwwlEa50mBnIpG
         5WAthI0aQ0Yj2J3+dz0Qku6ehUVjNZ1mw5p/dcJZ3y7TYPjtjLLSJ9JUYiIwBLoTxPbr
         rfYw==
X-Gm-Message-State: AOAM5331tfi2TcpE3lotPOD7q8k2vab6UTMPtqZdlfRQcV032MrcAyRa
	oI3kVMl/ESl+/EsJcSimzes=
X-Google-Smtp-Source: ABdhPJxNHGW2frv7Ctlan/UqdkPA6LgkKpiJhjlVqQ3Iu2VvRAVjHopVA8TeYtmM1J3GzY23ya9lHQ==
X-Received: by 2002:a17:902:f549:b0:151:fd3b:247 with SMTP id h9-20020a170902f54900b00151fd3b0247mr1389320plf.11.1646859065371;
        Wed, 09 Mar 2022 12:51:05 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm7259674pjc.56.2022.03.09.12.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:51:05 -0800 (PST)
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
Subject: [PATCH v2 1/2] staging: r8188eu: call _cancel_timer_ex from _rtw_free_recv_priv
Date: Thu, 10 Mar 2022 02:20:46 +0530
Message-Id: <20220309205047.45981-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220309205047.45981-1-makvihas@gmail.com>
References: <20220309205047.45981-1-makvihas@gmail.com>
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

