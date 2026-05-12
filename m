Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDC2D94BA
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601651; cv=none; b=DJmLiiuGR/3D356iZVDgoVpXKRAoaw9or16FZSGVl/DtVWwO0+gPZPWyLQUYhUbYWT6xG8rySUPYo/WkruSQmKEBSJJcwBtg+xYelzZiUXHl41iz+kbDlprzQlxQqQMrw0TOG5OR6C5IkEPMMrNxMGv3e59FOY72qMPToJb5PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601651; c=relaxed/simple;
	bh=giTnXTl6NfbRDLjBRreDcnbPKCyfmEa1nYsXy9GH9vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mH5f122bxBtJ+jYO+GHu9F/MWgujkU0dfk60HA/sgThXFcewCNbVDkZhTv6B9awJnPAws993ejSypPPWUyd37iVd7QH2W/qM5XFg4MPJ2Hcrr74iS1mOwTr36KN2okKtjdoMP7SBht7mEhcncmyNrbwFBc/PO5jQuQ1j3EgHgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHUKgbh1; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHUKgbh1"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bf02533706so52519117b3.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601649; x=1779206449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IjihfhIsoEdJ3PRP55l1hsuwJAwYr4TfStS2e2bbZw=;
        b=YHUKgbh1hX6xkRuEWCzkuhYS7CYLDKHfz9HhlWK9QubRyBzlrj7XXxKh+Nf6lOG2mq
         2OXsnG5eRTHkzld/v5ABOFWcuacL5v7avXPzIran7AlAhsgsDvYXUfqn7If4QViF+877
         MKEd3ULqlOEEMLbBGWac3wDRX5/w2+wfCqeia16jBvgHYEkxZSOWhLmbTfZGTztCLyPw
         U+BdbHkr+E9wJsPTJrni2F9ZlmUhTWJ5+sGgRP6ZIhWVAlYxcRWyr14fkb1s6VOUcH+/
         EVcGjAWrPvAaxaKllYTMkycX7w5zM81+WlvNfyvMSujZIsu7re5hmOp6Gw1TO9gUeC4/
         wxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601649; x=1779206449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IjihfhIsoEdJ3PRP55l1hsuwJAwYr4TfStS2e2bbZw=;
        b=RWZ+bbRDH1G8hadGyClh7QudSe2drUw+wgOpRf/10O1IXNmmN1dBp1EdqrQFXwwzKB
         iu540t0VWAyzLu+uTX75A9/NaSmVtu9+a6gIKc993/nll4l3dutD6VuDA+C7jrNAiGF0
         xjJCLpmwObOPeaMizw17FJFrwBWljE3n0Rcy3BhKTqeymfxZaEhwj4qj2abrRKeQsPLC
         Tkz8uclid5QJ3uY0wzbeMiZ+2lVpHLjQrTamHEElE7/pKVnGGnqT/TgE8zgdLXbtDL0I
         cX7FoUVmq/qtsYiPxX9klA1SSqrktdi/B4x9DJFIUVbPBfWIUjg1/s8qwf7bzhoAKNRO
         41lg==
X-Forwarded-Encrypted: i=1; AFNElJ/AWzEb8NJrw1idwMx1VKGYJiIHTx1mpPcNi1hqbJx6SGFlBKS0QxBv173nIWajmaG//E3rK57JrEMeUaFc@lists.linux.dev
X-Gm-Message-State: AOJu0YxRAzRPseyaD8Dn0DOP0N9gkP4zL3XkJJYRfP6adbCGNF+VygqO
	q6P2AqkmomGNChGzBwlvllZ/m/EQDoOsVxjIZHvUibSIZvcHpNckdSJw
X-Gm-Gg: Acq92OH1KsOTT36cM5ySECpahnjSv/z6mXI8OrtnWvt6bHEfwVNMNW/HeS5QQYpyY9Q
	/Xq5PCPlOPnSgQKPu4b3NLjrLk719tSCd4K+UNua/i0rH5v7iYUXWjtgLApkgRVSdNuLTySnGPE
	iRpNr7kHlbPn1ygEWQZLUXN8xEFgACGJrYD5DDrHaKOGgXUOBBDZFtHP/a+dhdlesp0qQ/HyiMr
	fsY2qr0+TFfbr+9b+wha/8V19JthCxnScHL+le8xnLqRdQvfPvejang9aZXkzysBnToUkMVNV9s
	yJK9hAcXxtwJIE9HfDklygFbT+WCK0BGVrIk7xtzv2Gi2me14pq3aQbK1KLqy195qPjsWwsL3cf
	fel5LjxYIFOFseoTXc0P+cj8Ej8tHonp9+JbNN2GSZ6iQvNN5Je+T+l0UiIfwJ7gJhgWAYfr3sj
	tAQlWe5wWyq/DldxlTWSSBGzpBzdQxSOy7gzRDtRMHGlNAqYkSL83NY04vP+1LEeQ0omt6pQNis
	agOiglA6spFbbQDg3sz+3H81n0C8r+Fv9gFQUk8WVwIsL/HM6/90IxoiPAMONdHPL16V+RzZ/UI
	Cbm/OIPnpvGL93E=
X-Received: by 2002:a05:690c:e64b:b0:78f:bc2b:83f5 with SMTP id 00721157ae682-7bdf5e15d67mr203045627b3.20.1778601648845;
        Tue, 12 May 2026 09:00:48 -0700 (PDT)
Received: from noahzen.tailef97f4.ts.net (host-119-66.flgaliv.gainesville.fl.us.clients.pavlovmedia.net. [153.33.119.66])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6654cc7csm171300107b3.13.2026.05.12.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:00:48 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	nikolayof23@gmail.com,
	linux-kernel@vger.kernel.org,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: fix block comment formatting
Date: Tue, 12 May 2026 11:57:11 -0400
Message-ID: <20260512155712.6998-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..067b54c6111e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1743,7 +1743,11 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 	pdrvextra_cmd = (struct drvextra_cmd_parm *)pbuf;
 
 	switch (pdrvextra_cmd->ec_id) {
-	case DYNAMIC_CHK_WK_CID:/* only  primary padapter go to this cmd, but execute dynamic_chk_wk_hdl() for two interfaces */
+	case DYNAMIC_CHK_WK_CID:
+		/*
+		 * only primary padapter go to this cmd, but execute
+		 * dynamic_chk_wk_hdl() for two interfaces
+		 */
 		dynamic_chk_wk_hdl(padapter);
 		break;
 	case POWER_SAVING_CTRL_WK_CID:
@@ -1881,7 +1885,10 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
-		/*  we will set _FW_LINKED when there is one more sat to join us (rtw_stassoc_event_callback) */
+		/*
+		 * we will set _FW_LINKED when there is one more sta
+		 * to join us (rtw_stassoc_event_callback)
+		 */
 	}
 
 createbss_cmd_fail:
-- 
2.53.0

