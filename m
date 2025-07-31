Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F59019C546
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753927062; cv=none; b=CyflhxCuMC5ELYyu0yQLWXN1sK/v32QYP37rkZ63JFi7a3CYbK/zDZi63PoIiIjDnxDY+vDBff+hPcuvi8DBgucr2HC5D63FG6mcLxE3zp24wb3kqh43rOohNiLp479Ywqg5ZGFF7FPvFu7r+omfBrKxeGUqrQ6wQuPJT1KRaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753927062; c=relaxed/simple;
	bh=OlIrL6Hog/dZ62WUrRojLYWigmmMAaDAXzFUp5n1kYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncXznA5tk67cOQyMSG1g6Tar9hw+ljwqpjrMoLl8eXz2BdRlB10k75Wk36b8HSbcoxc9hkQ8hBwpo0Hl+w/EAQRA07JRCgaIu+tv+qdgzYdiYnCrTOswJQeR/SXJ9BguZHuRqtVqKlVtPpeFpeMoQ6C5FmwSHbcj7LPWtzxLzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzuYOZsn; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzuYOZsn"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7077a1563b5so2458866d6.1
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 18:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753927060; x=1754531860; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7QTTqOawBYUYsYwroOVM1dcVFmIxvBI6lYBf0iVJfE=;
        b=hzuYOZsnPTj9AYcEn9UahL9anBmuHN96L9XtDwEEJpNwV2cqbJ9E3z/iLcaN4HZ9iv
         yZr4aONuzCm/eQabc/UUTNOwy2qx4E9ZewycBwdou9MLO6HHfYdDcPZMkEZyqQ+btI3X
         i7fNbQ+HE6eCPMDkJnjOMHljIRfZiFvK8CuACdZuFpy5/jtnTDTP9ckG5MQN5etOjcAr
         eLQ/aYZzcBB+hL8z2uqIQj0bPN1TwDc2Wt2pPqd84KB3viOFUJXHDldIkr/mqLN+WarL
         8VmBWUqUgbyhFKQTf++YOsKwHsx0v05T3nj7f0g2PxjlohHPE0eNsFj69qaRc2cVW62a
         eRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753927060; x=1754531860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7QTTqOawBYUYsYwroOVM1dcVFmIxvBI6lYBf0iVJfE=;
        b=AOb+LbATRn+ekwe+e0e9HEhMHY60sMGUfwHZJlYbe6lSfhEFivnGHQzXf4o0W+z9vN
         Es5H9Ie1WEkUlJmRZbyGfkYCx0mKQTkC/vkG3FEFuAchhBiCkIgonzxk9eI9K4id5XxJ
         6SJJ1AGGZbVVHsJFBQMAVgZQJpDq+WIUTo2XRgATGoGMNyaTsTyDpbBjBD2iCytcoQe3
         GE/tbSjUQjHvtO12Aa5eSG+RgWis8b47063QOMmbOwulGZISI3qtLw6MUCRsJJMmbW3r
         /V1Tw40pcNlb1QXh0Y/DjEibgNf/o9YBnuVDHjA4Ar3dKGi4ZBXMws4DQyl6h0tWoMTf
         1z8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3i9C0odx2pjRocylaYxAJ7ArViJwoSapyN7u8nkPHSZW7qB6V/yvCDg3pYrzZbvovRRaurjeI3NrAoOuK@lists.linux.dev
X-Gm-Message-State: AOJu0YzVlh+o/9v4fpWW3g+r2hjt3EDZnWTPMfIAG3h4glZMNkXbtIkm
	H3kR3Y2NA5PBersezG4ghvOq1dEB80RJKo1JmjjTay7e49KTc/LdhgS5HEcwFe1q
X-Gm-Gg: ASbGncvT0hHUMSV7BCkHbZ8twJ8zOxcDHCCzP85EX8nZxORMwy2GAqDv3ljAqgLor/m
	Ny+24nIJjbja/uUUlP5JhOC9e7xenqIzwci6OCLgY2fFkdu8Btxqoq83ii+m/Zkjs7EOumqTXOl
	1TRjgKfoBzsLsMAZ7LEiRWCkP6U5IVV55rJF+lxxKNRNXE944VEQDcstdqBHZKLuT0Hsz9R6uqx
	hVm7s+PlpJa49CWDZCfADxaUz5i2hErigzEJ76wc0HRnE3ftoxmQhtahRW2uF3/pWMDTyN8uUuM
	eHYx3io4dok99XJ5dVorriwTVguECNE27juX551hFKeA0Y19X/wremeo1yYqSau314yOwckdzXe
	IjH4irYPPPXtp9s7Z2qBbGbGKpa2fdGz7y7FOp2WIfd5SlA6Xa5U=
X-Google-Smtp-Source: AGHT+IGjMfT/cnEX10j+yG94taSRt9Nkr0BsX/6+hEgWyGGKuzSDLcKuHqrgx33PocGhmVFujg6VGg==
X-Received: by 2002:ad4:5de7:0:b0:704:f7d8:edfe with SMTP id 6a1803df08f44-707674ba71cmr73600866d6.51.1753927059737;
        Wed, 30 Jul 2025 18:57:39 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ce6ed90sm1335936d6.89.2025.07.30.18.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 18:57:39 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Markus.Elfring@web.de,
	vivek.balachandhar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Thu, 31 Jul 2025 01:57:23 +0000
Message-Id: <20250731015723.507092-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730080323.491138-1-vivek.balachandhar@gmail.com>
References: <20250730080323.491138-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove redundant parentheses from a function in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
v4:
- Clarify the commit message regarding the removal of redundant parentheses in the
  condition.
- Use imperative mood as recommended.
- Remove ambiguous phrase “around the function call”.

v3:
- Improved explanation of why the parentheses were removed as per
  Markus Elfring's suggestion.

v2:
- Mentioned the wrong version number in the previous patch.

v1:
- Fixed incorrect wording: the change was not around assignment
- Addressed feedback from Markus Elfring.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b8d72d28178b..7552f7e4d14a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -699,7 +699,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
-- 
2.39.5

