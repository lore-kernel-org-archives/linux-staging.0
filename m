Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC9204684
	for <linux-staging@lists.linux.dev>; Tue,  4 Feb 2025 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652309; cv=none; b=SpOHSl+gQinylGjzyk66AQK38uv1iqZB5ct1ZEfQsRIq9LoIrAwE0mVsuSP/OldZ9S3HOFm7aAQEiY8K8IDYj/tncea12E2AKTHzF5Ba1FGYnJH2iW2Tzh0VclU2rSQFp4+UwWIhN8VyokDWmOuLviZJlBy8wvfGd9ktkDN6bKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652309; c=relaxed/simple;
	bh=/KIqPx3OcibD6mX6v3Lzyi4ET0I49KQ/VdMRMO9wh/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAlIDBrrmtzNudx+bFGFndqr0u3jmFkQ+q7UcRdFgUTF3M/x3mLK6aPeIjDZxqgVwNjzRFep/S112AhDwSh5/j/QP79DbMYc6heCrCPgHt40axyPh/12TjHWRuF5OOEYfetkRflD8A8gymLoc8dOouCCch01LOHKHTtBBumjksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kScbvxUw; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kScbvxUw"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3ebadbb14dcso2233590b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Feb 2025 22:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652307; x=1739257107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lh9L/j2V92hTgmHwcgJ4LgGzf6Mnu2fil9QHhtdmks=;
        b=kScbvxUw3mT7inzBQnkTgOgW2hiVBPNcZ003OXi/wnU85jctCz+TAyeEY/ZN3VR2M1
         /cmIyAfFzXK1oqDT21Aw086KxNj2X93a/+u+05X9+yfy8DlGXdc7W6bJtEHWctdUM1Cu
         5Oc/caTLKL0p1gkhJFQXVmvBxtx6rjEonuwjxDTQd/gOplsb8RuPRs3mM+9Czdwz5yKa
         6LE3AKUDz8R/kroPIDGMSrZpCwdOZR5AJx3ZO1JCdp+Vpsh902HcjULEOoPfQivDHEMk
         yfm2A+Xa6ZpfrQo54IR4ILfiVxc3Yrfd8+S3VTnDEmSn5fQb87pN4w7jznkC2qPVUCTZ
         Tl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652307; x=1739257107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lh9L/j2V92hTgmHwcgJ4LgGzf6Mnu2fil9QHhtdmks=;
        b=n9XscxCIbsUyklOyRo0QITYh/DrK+jLo6iNiB+dJZa4FwGvun3V/YeVcZzis5S9bMP
         4t/ZX8Q9+oJb7PPf7sJmTW0QRChvgKAKqDomksYcdg9ziaOO7X/CVjkQXn+paaQ9/Poa
         dGqIbpiqGMUF+xW96V2A+KJ5l3T67oVNZjMqA7OQu7o7OTTMWIrrBg+hpc0S/0/gMzC6
         Kb2NexGcOp49p+wJG1BaEA+3jwRLGPPdVXuquLcI7L2pm8r6kyZB6osxTLdn3LK1ylJg
         xz3hF8iwWMftHUk5ImxGa6yKj+E8ytPtKnn3FYkxNxKgtkUuOLXLE2v3p04dPLrNQfkZ
         spog==
X-Gm-Message-State: AOJu0YyyBYg+avodDU2T/y4WvH6zejVZwepvlf3QsKzHdvKusAf4eSfi
	PK8lQW1iLOCtx6NBUiTC3l+VI15GuJhjIbyGAHI2UToLE5qAJRXv
X-Gm-Gg: ASbGnctaNP8xPor/9ODdLIf7vAPmAfWPThd6AgMwn4tKldC7ryp1RAMNBwJJ5ApGBDG
	XVMySl1hhqwrYUNYzR/n6tvVIYFdeD6wgs5Q7HUUv47jG4jI9bVZCbfxbCO1PRWlEoy+GaITpG2
	MRHjHJzSHkBpYXQdlrwtMZeTH9U2tz+XB2QV+a2meBD1F8f+eyFypy3W4aDEiWLiYtWEuhIPTIA
	x55xq2biDMo3HQk2NYQRWL07MoXge9DLMbORVEKyrJEpNgMIjgYB6oiYOmcN2fmjSrqEF0HWAS5
	YioVz2zAO3kUGl6jmjwiAyKkdDr0fMCU3mRc4be8rHCHqxbo0plzkuNApets+gQ3TLY/ccalec1
	I
X-Google-Smtp-Source: AGHT+IF55WgJ4bcciobrlt7SG02tK+/1rry6sDdSiq6H3Gi4wyzFQenCiUX1GRIT6gmiklZr8WGykQ==
X-Received: by 2002:a05:6808:2106:b0:3ea:5880:fe1d with SMTP id 5614622812f47-3f323b4a05amr15783914b6e.35.1738652307193;
        Mon, 03 Feb 2025 22:58:27 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f333660e78sm2934557b6e.35.2025.02.03.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:26 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: Format comments
Date: Mon,  3 Feb 2025 22:57:22 -0800
Message-ID: <1ed23303429f4c7170f92122a3794bc9052f07c3.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738651582.git.onlyian4981@gmail.com>
References: <cover.1738651582.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make comments adhere to the coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dfe036cd4ef7..2e9963c857aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1031,9 +1031,9 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	/* handle A-MPDU parameter field */
 	/*
-		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
-		AMPDU_para [4:2]:Min MPDU Start Spacing
-	*/
+	 *	AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
+	 *	AMPDU_para [4:2]:Min MPDU Start Spacing
+	 */
 	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
 
 	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
@@ -1706,14 +1706,6 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 
-/*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
-
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
 		u8 ratio_20_delay, ratio_80_delay;
-- 
2.45.3

