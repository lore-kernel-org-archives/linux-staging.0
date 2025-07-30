Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D219597F
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 18:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753900809; cv=none; b=bd2I/vZUSNeVqV8Uvo8qJEEq+7hTN0UGyLEIMLrAmbdN65ABos6zUHy5P6ECEyUxWwQ9nSFTlBgS9Q8QKYB+6uuuSn/+8IbK5LDH0rWyvbU8mMDrrDGLn1TXeoYeOXT2X/rJlLk1UkgF70rru0rZlr53upa5wrh/Vu3dKaZyFIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753900809; c=relaxed/simple;
	bh=q12LXBzQtE5vNm2i/WY7kOjnYF8AThpIfB96tzBkLf4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3F9WN4F9vfEHVqIWj5+gzrMyaSG3c0lJqBICA14ZbqdS8hsRjtbfJk1VQAWNw/yB2JcR2v7N+9Khuuyrt56D+NnJ+mgHFn1OXUGT+Enoy2EsTq/0W66GxxUyxXqXY/srd+WfuONMPk+lfkEw9DFipoApApc4Xf5Qxf5AZ2D9gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfBPjFN1; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfBPjFN1"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70749eac23dso867876d6.2
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753900806; x=1754505606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLv1kUgn6SKLcyh8VLUuc6r9Cuh/UEKenIns7AFq3U=;
        b=YfBPjFN1xIGuXkwMlXCbJYXBfmZbDB2T/A+qEpFdyhHN30Bra5oXp2/vyqW5hZ9gG1
         z/DSWIVx8NxafAZDf3TFgDiZk34YuxHchitEkTNsNXutAhGwINu2akihUWLy5TNST2/n
         xkoSsOcWf4TfD0wUoS2ea0SmoDFpNDJI/f5T6J3jYsxubOvEKOUIExiYs46ooei3XD85
         QPWDwcB1y5bjdxo7OeOyh7gOUBWEvfB3uCzbGib2/OpHSQ5ErDUunTF91FFzKPQx0ZNs
         Am5PfyUQ/TeVV7lQ8pF0FBGNfIHceHgJa5CsRfdudLNdIXp836gjOC5gDIBQOSWvBKeZ
         uIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900806; x=1754505606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWLv1kUgn6SKLcyh8VLUuc6r9Cuh/UEKenIns7AFq3U=;
        b=SzPFdwF3+Yqxqj643SqjWbtk/57PNJLFou7RvcFY6aQ+ZVgXFlPSx1FJOEML795SJp
         UmsilQgQAx7V0WtYjDwqba9fsOBnjuqiV7v4ATYgduo47bKGHgnLKmWmSGIWM0ChS8RT
         s7pjT03M/nhzGMKGCJyKiMEWDNeOQsctJUGvKQqoXMvza1Hy47qCCWZPQe6drEVFZXOM
         PkFBm4DUIFmDkF/EaIF5w4BEbJ2KuTd3sBLq266ObPHbtX928LdeHDkGeS5/eX1ZWRJS
         MJP8W1QQycxQdzIVALpu5KRKvQWfnBV592FqP7ozh4sPtxgFVwiGs230iaH6gTjQEuiY
         Hr+g==
X-Forwarded-Encrypted: i=1; AJvYcCWnWD8n//VlfWnbrSGBaYy9dXOlnf0pyRdQPxhcxQMhtGM3CngraWO/Xx6CUZbtTebm52dqdObvTWBt44II@lists.linux.dev
X-Gm-Message-State: AOJu0YxG0vrxJ5xvh3eyzsuaL2ttF0a37HQ1ia/suAVV/010efm5MERI
	dFcwtsUIAroPx4qMihQ4BM0KlOQ37JU+bWFdWBfsywBCufqolVL7s7V4
X-Gm-Gg: ASbGncvPdg7ulxr9X/bx1sq6vsNRZ4IpZM5mG5w7tn5xdS/4ZFFwYL7q45m25xyFx1F
	HawW6hG6XaaeRSAbhUCcIIE+S/pRFw9dtp6RWOOr3bvYLaT9DiDe4CiPiswEXawAPmfmqFvDebZ
	ZTBqff0rZmmJEBrND/J/boXT95Cu1dWxPeRY3ZL6gDXUMIo/Zl99aG3ynSUh4xUD4DMsILLR1a7
	xmDMyD9pVznZrQ+AARnksrze08rMOhbql2YVj6OpJIzCjJQI9+h6CEJCey0+BT/RIbbXCJ3Y6ny
	943YRlMh1TABtlanXhNCWf7A08JylcmFw9ybeSb5RZaK63Pfl5O8sXp8NJ7axeB3vf94kD64xIN
	mTwaUfyU3cOho1se6n6jSwattUFj5O3Ud26dI+iBGFOIS3fphlCA=
X-Google-Smtp-Source: AGHT+IE4++CNg3UAGgJK+/LWn+6RbEykwxS/T6Kamr85O+qD0SFzQUdw4RX4iRcCF4uxmqUwf5GG0Q==
X-Received: by 2002:ad4:5cae:0:b0:705:11dc:546c with SMTP id 6a1803df08f44-707674da9c4mr81435576d6.37.1753900804873;
        Wed, 30 Jul 2025 11:40:04 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70729c15762sm65463206d6.51.2025.07.30.11.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:40:04 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	vivek.balachandhar@gmail.com
Subject: [PATCH 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Wed, 30 Jul 2025 18:39:54 +0000
Message-Id: <20250730183954.500155-1-vivek.balachandhar@gmail.com>
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

Remove redundant parentheses from the check_fwstate() call in an if-condition.

These parentheses are not required and violate the kernel coding style.
Dropping them simplifies the expression without changing its logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
v4:
- Reword the commit message to clarify location and purpose of removed parentheses
- Use imperative mood as recommended
- Remove ambiguous phrase “around the function call”

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

