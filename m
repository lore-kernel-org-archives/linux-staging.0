Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198C3C4B83
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 07:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222013; cv=none; b=p2jj93r35LFNr/jcNlzUqYkMSv+KUjuB4rfrJDoBAxVfXu4tIEX270dyaVptUs5pBko6jsupWfe0UbBYkZ5Kjl+yfcgbadJAh6MjCY0JnEEmIsSVH9ptKIJlkopQQwgzP6pjnfnjTqsTCdm4UvFxIC+kUnPCNkm3FmqgV5LKwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222013; c=relaxed/simple;
	bh=VzMxwIwyRo/sbI5kbQ8EI9kU5QjMl1CjA4UtQ4jDb+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1w7cSLbT/f/tw5xuB+HS+T0EClFgzlung4WYaoZSW8LmVjsOc+sOjg+CcwqBTWKu5Zs8Z2ZCr5fhAutZkEDDKcqI4XJflpkbGCXbFLZMkXYNHKB5IRSZzmKOW7CIunt2hNk+lhNqPjedVZsE8LhbgcfpX3b07JFT7DXYArwA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbT+ibDG; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbT+ibDG"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so5138469a12.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 00:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785222001; x=1785826801; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6cNHvxekT4QgV2PWxT3ai+nMzdCutqOi32fqeZlbvY=;
        b=BbT+ibDGwUIUvmk/i3vzrUdWubpDUamQS7U1QtOXzxKsxS8vo35KiWTe1cUYY2sBmD
         AVNZHW196lTaiYm5eGbTAVlDQYH6CHQt/shPphidFMcASkFtKKJbfRJiHlzZI+QS2+79
         LIUL7aaGGiSS4xlmvFFnzOvhXiiwoj7TbY0HJVcN4saV0b8R8HwB9MHrs7/Q+CPb0eFm
         NDGpKTsckg8090yT9iKEoDk9hk0gt3Lk6Cqth80RzSSurcrBbHOHcGsWFSt0nFj+M94m
         1ctyYys4GTfMpkKurpQxH/PjcyEy2ioUD52Iak7IQBjgbEWu59KgdEhskh4nJITVGhE6
         64Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785222001; x=1785826801;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6cNHvxekT4QgV2PWxT3ai+nMzdCutqOi32fqeZlbvY=;
        b=JoXuaHAzuC30TgvJUvOXxdfUg0R8g4VZnNK9bDsm/lgAQeupfMKRlbZIGbVAGCRPCX
         LXm8WkfKFUxGYiJyb027/fLZwBnOzfxad2Pqfx8tM62n4/rJ9k3CRZXGBgNU2Yx1Feon
         pfU6gM+OIn28FyHwPfCVRhotPU1TtQCGaqfoyfbn/KPL1F5SFbCmxNuwp4+a4sWygA02
         QE4tkIMAEV9pR3Pe1UA7sPYIghacNl5vfWhRedSidYThla9MG9KG/ksuUvl0KXSlgTxv
         nPU5goxVZTeTmWiWJHhydACWlLge3UqfowXh1/5o0LM7hQM/7sr1I92A833fys5puW6D
         gZ9g==
X-Gm-Message-State: AOJu0YwYEOY4OfNGM0lJW5x0Xm4PYj5sjjqdxloDHQtXuZVfUfQ50Fbf
	iGCkWpOkS9PiIQYjqBp/vD26kJVgR3JTxVEifizz6Cr4hNhuM1lxIp8zlx6RNfUfYm2iEQ==
X-Gm-Gg: AR+sD114B9oqro7G2KUjNOt47EPMV3bOYRae4PzE+a0DlV50W2pcUa6Pjw1fiI4tLbb
	imRoNLVmYfFk5b1oPVXT83KnPKrz3cSpzrps6B4l+Vwl1kfGy96qYurBDreej2QQ/N9aR/rGqk6
	9q/e0CCBUKTz4kdqVcaCzzUpg8luflkn7JpL96+thPaR7y4+BlvHHkXE66U52vd6Sll3i/VIo/L
	WGxI/WbL5pcJCJZBSiVMV8VYFnjfaG8QNCQcI82Zfl9xYo1znPAIwxmQfUtOmvo/ya7dhdSWIAl
	VcZFGyz6Bvx61yFR91f/GqUmCE+vfXBY8lUnU9IymP/LBrUcUNsh2nAs7WOTSoDqRQGkVQtKk5R
	63tn2DKpnUHYX0m71lC/hSKBR8/3IR1AvQyx3JK0oHg9m4PKrnApj0/YIa80bj3rPkLaVNi8Nkh
	D0NfLHjAjyjAHgRhWxkZz7Mf0jCKZuYyuDbw==
X-Received: by 2002:a05:6402:916:b0:698:c0d8:e40a with SMTP id 4fb4d7f45d1cf-6a034a7bceamr439402a12.38.1785222000744;
        Tue, 28 Jul 2026 00:00:00 -0700 (PDT)
Received: from localhost (50708651.static.ziggozakelijk.nl. [80.112.134.81])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb52d6ebdsm3642430a12.13.2026.07.27.23.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:00:00 -0700 (PDT)
Date: Tue, 28 Jul 2026 08:59:58 +0200
From: Max Raulea <max.raulea@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: rename camelcase variable psurveyPara
Message-ID: <amhTbmQRr1MzBa6G@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reported style issue by checkpatch in the rtl8723bs driver.

changed the variable name to survey_para to adhere to Linux Kernel
coding style.

Signed-off-by: Max Raulea <max.raulea@gmail.com>
---
changes since v2:
	* use survey_para instead of psurvey_para, per Greg's feedback

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d8ad1c75195b..9e420663852e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -525,7 +525,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 {
 	u8 res = _FAIL;
 	struct cmd_obj *ph2c;
-	struct sitesurvey_parm *psurveyPara;
+	struct sitesurvey_parm *survey_para;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
@@ -536,18 +536,18 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	if (!ph2c)
 		return _FAIL;
 
-	psurveyPara = kzalloc_obj(*psurveyPara, GFP_ATOMIC);
-	if (!psurveyPara) {
+	survey_para = kzalloc_obj(*survey_para, GFP_ATOMIC);
+	if (!survey_para) {
 		kfree(ph2c);
 		return _FAIL;
 	}
 
 	rtw_free_network_queue(padapter, false);
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, SITE_SURVEY_CMD);
+	init_h2fwcmd_w_parm_no_rsp(ph2c, survey_para, SITE_SURVEY_CMD);
 
 	/* psurveyPara->bsslimit = 48; */
-	psurveyPara->scan_mode = pmlmepriv->scan_mode;
+	survey_para->scan_mode = pmlmepriv->scan_mode;
 
 	/* prepare ssid list */
 	if (ssid) {
@@ -555,8 +555,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].ssid_length) {
-				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
-				psurveyPara->ssid_num++;
+				memcpy(&survey_para->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
+				survey_para->ssid_num++;
 			}
 		}
 	}
@@ -567,8 +567,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
-				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
-				psurveyPara->ch_num++;
+				memcpy(&survey_para->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
+				survey_para->ch_num++;
 			}
 		}
 	}
-- 
2.55.0

