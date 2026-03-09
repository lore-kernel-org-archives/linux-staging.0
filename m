Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031763314C5
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087292; cv=none; b=mpqb35noRmXxSTkGd+Hg2zadcDqU1xM9x1fuv25gW+9Sqo18YP9QiTI6gTl7NRnaDqHwXfMijeBv2ADXJ9VbmHtBQhu9bDnFAvo9ed2bi+FANE6/7lxwHvX2sfvzYNDlka/vSdIxovvw2P7M3utq7HgkHvgMe37X20P/EBZjx7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087292; c=relaxed/simple;
	bh=iJRCLXmYEnEQ9PGt5kr4CVeovtP7i/mgR8yS2TgOruM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTkVD3ikyvQQg4NdJOufpXk9vfbtuSkDuRx/3t09f8q1ghOHaD8U5JUqdiXpdEOyB5laZl8+LqOxpbBKwS8shW3traX6NbVJT0+svUQFOIW53ScH0UiSiQa2Qx3pahMUOvnBTnkytx1mQVq3FB3Y1x4tm64o9cD8ptBy2xA4ZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBRrn10l; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBRrn10l"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad79df972so11583169d50.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087290; x=1773692090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aS99MK3gZfldxSuGEYXTxguudF98HKQJnFSqGhpYaWo=;
        b=JBRrn10lXDKa+knm1EEO5aaqp7F27ZPDLSjAauyeo25RxJQVVvxtyHQqCNfWnrVLZt
         ZPM2YZL9atOdeVAY5rbjgjNAWBlI795JnvGu0de0nKljR+a4+1Cr/5BSykZHmPmbhf/a
         h+/3xQ/HqrYV7dJg+XyGqw4/AJO9xNet2ax3uQVaVnf8Xcpf1U0ePurPztaHLkEL3tGH
         a5iSJwQPKf3YWMMz5IifcidCfjPhy+f598dzUvb0wrkbupJBeGJ9pgAAfBeQkjK9R3Kl
         HE5Cl/JoSjDWeLEYfr1Wt3hqzman7N2ojZjJ6WqbMCLTzdZMohdHSCOU1hh0McWyf/0+
         IObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087290; x=1773692090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aS99MK3gZfldxSuGEYXTxguudF98HKQJnFSqGhpYaWo=;
        b=tCCFk67vhJzCReSwKePjxlXWFobiN6gHKvWtoJWPsP/vXfx1w6EkkoP+/xLxijOwnj
         GqVwoX5HRL3Z+yrkIrAvht6z5ysEPlclCUBr3jtYf9/OEW6iMR96wlJ6seX1AEPXog8I
         G8GES0e+aaQHKdUb9FMtZvSHQQUdRCCNAp+57GqgF9/h2pS+Mk/USMFR/R424D0RkLFr
         v1g0qwK7ZJY1+U9G3VXq7LY+9dJxNqw7fHgMDc1MRTp2RTIv39WFjqfdZr2kiCbyVmt0
         67sgMX4/jP0adUe2I1A/JkVfS1AUAWGsyYfapIxuuMrNa7lxreNxTeOrE35C4deM6wGj
         Uxtg==
X-Gm-Message-State: AOJu0Yx6FSLG6TYZekUYB5DCMHrZ1m+YxeTIq9t6P4wZv+Gsjm+2C27i
	cPFeXln3tIsywRHQ2g5zqyNecKRCATm9rBmGTdSUoksxOsgiIqgyHx61
X-Gm-Gg: ATEYQzw7+UWLva6lgtjhzsKoKiZzjXcLVKej9GX+Pt2rHhyX1H6dzSZMC4QTA6jcUUA
	JoY86+W+//uGjOZwXdf/Xy2wZKJoneG8YdIWkYbL7xV9XDflxFQrnvVenmKSGuAaQBd2SK7AkdJ
	Erwx0Fri8deMoT25Zn4Yh7eKW8IT7pjl1MnxD4tmHOEbkUi97aOj/fQ9DCmSFRPxHvvUX8wILIX
	TZsY09ndxBJYeFtMpswkOZdAj2KVPIiuIJdy0TkNXe7NGzCWUTwZ0qkUfcHGpp9RTVc2LowkLuk
	h/x40vCBmZTCUrzk2QTk7i8fVmAO8PucgJ82ou0gEX1Hm0P3aSKcY6Dm0AmIBuz3vBmI/VZ9So5
	bmipzk3gAtBYf7+xQNjlU6mlxCvGDFwELqtfxirjLdWeKPNcQzXM4+S75A66IE2g3+nNNK6WBXh
	Z/sp9//xpXO95K9eoM9UmQ92Ij8Ie0pFB/6/c=
X-Received: by 2002:a05:690e:16e1:b0:64c:b401:f4a with SMTP id 956f58d0204a3-64d1438c888mr8307442d50.87.1773087290125;
        Mon, 09 Mar 2026 13:14:50 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5182999d50.7.2026.03.09.13.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:14:49 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: replace rtw_is_desired_network() return type to bool
Date: Mon,  9 Mar 2026 23:12:20 +0300
Message-ID: <20260309201257.16984-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309201257.16984-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
 <20260309201257.16984-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_is_desired_network() used only in rtw_mlme.c file and
always return 'true' or 'false', so it's type can be replaced
with 'static bool'.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 244dacbdffaa..7bffbc673f98 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -588,15 +588,14 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
  * (4) HT
  * (5) others
  */
-int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
-int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
+static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	u32 desired_encmode;
 	u32 privacy;
 	uint wps_ielen;
-	int bselected = true;
+	bool bselected = true;
 
 	desired_encmode = psecuritypriv->ndisencryptstatus;
 	privacy = pnetwork->network.privacy;
-- 
2.53.0

