Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C52253A5
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 08:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862620; cv=none; b=UxfBEnuFNloLh3+9TjuSBSyvpFffuNRZNU4OpjhyoaenQ06Pzpeb6bIqax85UFiUF4PHMv/HrGOf0zndpHGPjuUZ2WjprXrE5Cza2j5SjmmqL2UGD7xziXxPO8v2g+Lt+9h7MOYaQY9T3QUoeoMYfaQNte1bPvIVtj1WrW558To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862620; c=relaxed/simple;
	bh=Aa24vLyXllnQg3WiYXULS3Wr+CT5idpVokShGpFyeRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZWa15jYIsMrNATLTOBxhr0P1dTIjaoTH9xiCr0dWuV71xNlF/0KwuMa1+rqxKPolXg2YQJCMNDHUkqk8p8Yn+3R3MlB6WHKt+hgBSb7BTtW2wZGuo22OADYcdw+QhX7JfDlZeJ7iU2ePokKkDZfcLFl2rGrQbwBJWVW1SNO4iYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipPvY5eP; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipPvY5eP"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e32c9577ddso623425885a.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 01:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753862618; x=1754467418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWnQEPlkqPV7cSY+6x+N1AZksE2srmMJWG66mvfTM4E=;
        b=ipPvY5ePgU36sKG5RkoDTaSUYYXX+QPF1tDiScqskuZteir7rKRwc8XM1K25SLKRIQ
         bCVglfFFu/xs+nW2Uu65uy2ZqlIrgghhPm/oUczyt9Px1N+S0yq0+t97tWn+oeJDvi69
         szlJiLtBdt2KubSQbROWR9zT+YmNK3gQsTg6ZvWhfm01Q8Gv0gQYSpX0ni1IYH4UFYpw
         TjfWRatWE7mjZcD/+5oVaAZQZRLMtf2zbAqPbvb43uJ+RrGOFEod/+ZVYSghShji5T9S
         20sgdBh6kglkb6zdNpgBwJKIYyxE+dANHFwyEw/9Br5VyQtUxWCkp1nf7MzHOiYpbXlp
         LYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862618; x=1754467418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWnQEPlkqPV7cSY+6x+N1AZksE2srmMJWG66mvfTM4E=;
        b=EFj7xTOhXJi42+98tzxaZraOmwxfD3jGActhxnk7JNwyVytitlY11SyPOCumgB5Uma
         aBu5H2HSi0oyBE98G2eGPMBqTu1as8r4b4RpTICuDWeDeynzmDn4xCDdzSrN8Xw/ZZd4
         wwBJDmbcfm1jficgG90OC1TET8mCQaYWJY+bEP4U07IIH3HbNnwOmaPurUUgmxQi7CTt
         yPimwIuQvKcJ9EoCguCbSI8xHJekPNXT7ZV7TLWrpMukFeJhQXLeI6GNbqlMQsvZNdOj
         gzhXRXvRYb6A/8jZ+RjPKXHL2yK3HtuSAiYzi5/JprcYrhB2PfCe4+vsGtHNwsfGl1o3
         8oOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX29PcgOBnVLkHy3vvwfw20PYG2Dv5LILoijtImoTfV1PS1R+JSba7ThLyEqZaX5arZIsSLlWIQbvs23Moe@lists.linux.dev
X-Gm-Message-State: AOJu0YzT4373arnlld8NI5dYoXBtJyl7xgwJ53ArMEnLTGmq+29AYzdg
	2v8ZuzTHXj/YZRkXc0a+JN7jVYphPr0+HbQukKtig6uYNJbLBDnQXWdR
X-Gm-Gg: ASbGncuwuHD3mJLGUyI42eWGVChinIuU+3Za5dFtFJIpT+gB3hzpaUZAGjPUa2vY+tR
	+4KBypIZrWOfW2rEwNR240/j79Vf9zvhe6AuuVtaXY1w775iB8OimPN83B8oZYrGjJ1IIjStnZ2
	ypwMXllTakM9DcR2vV9hT6yjOBs6RtM8tWvoVVcPqDV19QHgpkH/7Qn/dBX+FrgZx6/Q1LKCq6v
	IfUEhQzhywVsJ6nZBT4anzp1Rsk+RKkq1GSr9H/fsSF8mr/I+eow1QusNx7M022MnTxdYeA2QYn
	TKHcPvEBSQ6ED6bhWS1uqQylJ6UkuUdbfrjWwL2qMo/v3xT+tC2zST/rRwCm2eEyPF8TZ9/bfDA
	yKLBpHjBsz4AQS2AnIgQhEk6CZXcxYVwaRN+/Tlg5eHJgEyga1uE=
X-Google-Smtp-Source: AGHT+IHCJuWpsQB07TGtQhgp//yWRYtMBSVH9da8NNUWbPjYxj+T51roVTDFRzhkXvkIH9EtoQ+9Tg==
X-Received: by 2002:ae9:e008:0:b0:7e1:9c2d:a862 with SMTP id af79cd13be357-7e66f3534ffmr243727785a.39.1753862617814;
        Wed, 30 Jul 2025 01:03:37 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432ae1f7sm530027785a.40.2025.07.30.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 01:03:37 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vivek.balachandhar@gmail.com,
	Markus.Elfring@web.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 14/20] staging: rtl8723bs: remove unnecessary parentheses in conditional
Date: Wed, 30 Jul 2025 08:03:23 +0000
Message-Id: <20250730080323.491138-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728064328.423024-1-vivek.balachandhar@gmail.com>
References: <20250728064328.423024-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extra parentheses around the function call in the if condition
are redundant according to the kernel coding style. Removing them
improves code readability without affecting the logic.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
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

