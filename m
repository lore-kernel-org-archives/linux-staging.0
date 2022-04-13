Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EECD2F3D;
	Wed, 13 Apr 2022 20:11:49 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id z19so2213002qtw.2;
        Wed, 13 Apr 2022 13:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ul9FGVJ1sqTdARK0mUZLH5+vAqXgfv1Osb8Y+BayvnA=;
        b=g3gjqqtdqKQE5IGicT5Wjd9h3ncG7DVCNTkMIk04qmTIFPfSPARDB83o4ujZ/aj4BW
         1Ziuz0voyvAICrIB0yVPtQMS5aEEyJsViQkfhCuBv2rFF2P6KAlcUpGIfSQuwOjSAg9+
         PoyxmZghi/DZFjwjf7KINxaxqWt02zgrnI4bz5GtcJTQ2iAz7Z/lAgVks8UJPzzGp0vR
         O6YdTukXugvGAKbCAJHdei/PAAX9L0dr+/v6acnR6iuk3/kdXqHLFmvmZ9yE1Uc4KKgE
         wO4qkmrufxD+mJhNQenzel3OKXg57IvUXg536Dgbh6dnNlQDSPstmwjlENL4fSy59SlU
         UO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ul9FGVJ1sqTdARK0mUZLH5+vAqXgfv1Osb8Y+BayvnA=;
        b=t5IyPzRtCl8THqZXjgWs7Y9Vmn9+K0PTVJodCpd325yVsdrGNqd4sNwZDQlO7eD81t
         IXJJXTZBwW+dmjjyc2i0dlVge15AbrJKRHC3oEaBxHtMPdx1u4n2RfWUDIEDTn/YKwsm
         xxmJyELiQbQ2/Du52bgCKgSQaGe/MDFToNJStJMjOnsGlKjOqPyMqZf3fcHdKfkE9oLv
         LnhZdB/hpA+PSEalN72USyRmWv1dyXA6DliyrR1zYe0tlnOgNXcXIbTcYygIvtKA0uwb
         /6ZMczfWcx8d4w24jDShHuVr5RshBNVQ4P1JETJB07969lMmaDTBod7/P34vK8GslLbn
         pebg==
X-Gm-Message-State: AOAM531ZnkSjzFaXoOW4jqK0ChgY6CPiH3S46nkVVtHbJO3nXpQGD9AQ
	YsSx9qbIOEiP/4kUWCHlbn0=
X-Google-Smtp-Source: ABdhPJzfi6bbVPouWPiwjX4RCv+GQvPEnn27rrOjadz/T8qn0tC/JtVXXDXSE2vWCCCbYKdHSZ36SA==
X-Received: by 2002:a05:622a:408f:b0:2ed:12b7:2e9c with SMTP id cg15-20020a05622a408f00b002ed12b72e9cmr8351994qtb.309.1649880708326;
        Wed, 13 Apr 2022 13:11:48 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:47 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 5/6] staging: r8188eu: replace spaces with tabs
Date: Wed, 13 Apr 2022 16:11:33 -0400
Message-Id: <c2d719eba2a374be573034022218a098e4db9e77.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649880454.git.jhpark1013@gmail.com>
References: <cover.1649880454.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use tabs instead of spaces. Issue found with checkpatch.
WARNING: suspect code indent for conditional statements

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index b943fb190e4c..7a90fe826d1d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -722,7 +722,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			pmlmepriv->to_join = false;
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
-			     _set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
+				_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
-- 
2.25.1

