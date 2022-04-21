Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702A23A0;
	Thu, 21 Apr 2022 19:20:47 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id f14so4023719qtq.1;
        Thu, 21 Apr 2022 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=waPvZGOg2+RC3HM/74+dHiUU2qD9NP4c44RrV5MzX3U=;
        b=W9ybfcqWpycDEozBpfQU6LFay8XtJafMWTs7wjxBUsAiHQCiVqgK/TTf5zf9GOI2pi
         sypB5HYbVxR6NS02HKa1y4yTaUDEZpGyl6by7caBkMBxSp7quXUzwAlbGR7eIDCb3eOS
         8v+4VQ+TsK6VtBS5+1XHr5be7NbrKIH7M8czJl4o8/VbEU0pJIPrqdo223WjtQ/fGS7+
         z3PMwJnGkXpW4Mhzrv/8GVLJBMUosYFa/A+c4xAfxbAhDTiUUVKD/NXCY6R22f6EYUtB
         lhF7YS3NHcNJmEdQz1yBlB5xtJiWU2fP+ybgvnNXJbaOx34zazR+j2dbpKGJFYBOfAb+
         mzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=waPvZGOg2+RC3HM/74+dHiUU2qD9NP4c44RrV5MzX3U=;
        b=denfdL6eigMjIBHKE0bV8iQT/q7HyLw1AjzoA6w7UZ7Ehcw5yUrqVKZq2ywbrTCYzn
         4+EKmTsYdOnqP0QL0Zq+QmuAm/VDQc+Q6PoFJIGxXXAQHj4X9Md4dYBpX657YlrxqUwH
         LPnmcv5jz/utLDpeAK3XSbAt2xcVU6hnG95AeTjMlGjTdadAf865GJR/iCLmazy5Dkes
         e6Kw3yx/Mr6pc4ow3S1AMPZc4F8me2IG62zquADKweb9VzW67/0ujS591OVXjOFkPpuB
         hWvXAjCbX1+evxgH7BPLauJG+qz4Ci7VqLq146LeJlwUS4i8wysZZm++2rtZd1LoAnD1
         R45A==
X-Gm-Message-State: AOAM530hpQRf5/8eG2pigH57J1hQDR8IJxA8DT+VU+3vESbapuTFdTry
	Pki5U9Ekd+KAsXXSmC1EYyE=
X-Google-Smtp-Source: ABdhPJwh2SbVL0Zx5HMApclIxaVzYaeCo81OEwDlcihKTpvq1Bgtr7vbzN2dhgpj1kHLG+3mkF6ang==
X-Received: by 2002:ac8:5f50:0:b0:2f2:1e88:f919 with SMTP id y16-20020ac85f50000000b002f21e88f919mr745715qta.535.1650568846914;
        Thu, 21 Apr 2022 12:20:46 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:46 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v4 7/7] staging: r8188eu: remove unused else condition
Date: Thu, 21 Apr 2022 15:20:32 -0400
Message-Id: <bba338ae5f9992dbf2a64b388f7702e6b287d8c2.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650568579.git.jhpark1013@gmail.com>
References: <cover.1650568579.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

s_ret cannot return '2' so this else condition is unused. Remove this
unnecessary else statement.

Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index d422ce87ba7c..29b8b101180b 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -723,9 +723,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
 				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			} else if (s_ret == 2) { /* there is no need to wait for join */
-				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roaming(adapter) != 0) {
 					if (--pmlmepriv->to_roaming == 0 ||
-- 
2.25.1

