Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D226FDBF
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 17:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779556754; cv=none; b=b5BwM2qPVz0MdOU14Bm+8+YgH9ztAimLoh6UTSK/H95lOKhT4nHOSNlkOYa/fx6dI7UAkJZYpu6maiZ4IKdSm2+O9adjijbC8HWIW7G+f5JXtS7ZpcVk6sMTDm+3kqGuQ7Pux581GzfdQaHnXhoYCZoFC5m49BLVk8AmDb10kEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779556754; c=relaxed/simple;
	bh=DHSacsnvA5vYyjgkZgx2tix+FtjuLdBORU5J64bKfQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IBjxxKj3JQcdBg2JSEossRTaRSMIrRw7HI43UHzJyb5vwkbkUFJYxnnwiY/TJB28Li1QzkfIN8qQBh3h9IBYpnTqMk+nJpp2ulb3N5GcSnAM9UKmQhl43MSIz8omSu/mHgHkozSZt/PbwHVMECtdfiBEOMq01x6VRFBdGOgossM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR/fIz3b; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR/fIz3b"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-366139223e4so5078329a91.0
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 10:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779556752; x=1780161552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+2LbW+O9qlUEFORa5MlmvU2iTwGKJi7eJfkUVLjofU=;
        b=CR/fIz3bCICQWn2OTFf4onaVEx+eXKkLjJS+F0/pKstKogXpxSg/+gLp/JGnPFeFar
         IsVxu3WSdHxqJTRKffVc3yHmZZONnHazfCqhXGpHW0fvlNitA4MYFDdeYRNpmVWXcHZq
         PTBO2OsvTJHJe6y52T/sX6VVzlM9v3CKg4U8dglbfRXIuPbjzPLs6wzxD1vYgyuZBKHy
         HLGRSHSSwHnuKsbFiMe2EElwCorjL+U3wk+/+K80OlmR1k9IGpp9TAH9a4XcqGvG4dz9
         N8tLKjFkBqlTWuzkk+nfCCGp/qf+DlPG/TYoyjA2iiojSwsxIhXgftUZIKp721caT0mw
         o2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779556752; x=1780161552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+2LbW+O9qlUEFORa5MlmvU2iTwGKJi7eJfkUVLjofU=;
        b=SST5j3cSxjFKjKoanQNnsrABA4zvNcHyskv2Bzt/rm2yvOsnXnu/BOc2HESvp4io0v
         e+wpVpBW/I5/HtgDBK77PjS1izGr6G/nFwoytAmQHb4bOxPOtsx1qeLaBd0vEgUGF0pr
         9v4iZh1t8qXQF2l1KeujJRRy+wIOnPzBauCOfhWPFtykreDhJu5JfLKA8Ykf/oYCERe+
         5P4Zjv2Mj+2UEkFZ0+5xNFZ0y7eGb1aCPy3N7W7SQjEVNooSfPv9ezOLFswQHkg/ZgSk
         u40TMoqHQX1ZhMcRYwtO8lrChfY8JwIsWhuLDKHq2L5RWXL6nmGkoP1xrg1C53aLz8bn
         /fFA==
X-Gm-Message-State: AOJu0YyorcsluEdRlagHXtHF3vYr3FeB8Ew7WCy90WkD0VowvNgpDwuS
	XzGKk27unGftY+L09AfDx5a6OLG/e7ccj1nMkBXNB71vj/+siqMhoAdvDl2dmjK6Ong=
X-Gm-Gg: Acq92OGnhufjo8YBfIFF+TscRH8ypTNBlQ/tpWa8VyPxVOvXGOABPViPl1K0Jvv+LjK
	SUHL6pw73xRqa2Pnqedskxr9053Ufp3pejNbPokTVsDrBv6DBpMe3Ho+4+DfGLCorByQGw4lOLa
	4lvCtSXokLV/wHZhM6Jvh1SEj9IPKngOoj2duYrUB+dLK+mWrTSR5QzymwPmrukSKkF97rdynjZ
	YK9bYTUQraZxb8Twvq/bhcS+u34ND1wGtFqxSSw+c9EMJN21TnjQuqJRohQv+tOUUIJPkZvF0ED
	RNivN05tIkeIuphWx7pCZCyrNRfvNq4i16dRf0iFwUkem+Im/tEU0Q4gkQl+tJkEXs0U2ntDIIH
	bxC1+Whhwj7sD2sT3cPae+w/0X+htOTTrM6scymdUK9+dX44JTpvY4glmVQG+qcTU3zLjG3kE+s
	YMGfr2AD+6Ga2Rwah7wRgFkoYpmVUJn3/wSg9xFc4ga7kyDXXAChjYk5xUjUmbBL7vod7qO345V
	pFjauUo85dE8EsxDA==
X-Received: by 2002:a17:90a:fc44:b0:368:85fb:7b8b with SMTP id 98e67ed59e1d1-36a67636980mr8951188a91.22.1779556752133;
        Sat, 23 May 2026 10:19:12 -0700 (PDT)
Received: from MominYounus ([2409:40f2:1046:520f:fd16:1031:1f49:c61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cfb57sm6894939a91.15.2026.05.23.10.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:19:11 -0700 (PDT)
From: Mohammed Momin <linuxmomin0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammed Momin <linuxmomin0@gmail.com>
Subject: [PATCH] staging: rtl8723bs: add missing spaces around '*' operator
Date: Sat, 23 May 2026 22:49:03 +0530
Message-ID: <20260523171903.30484-1-linuxmomin0@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to the Linux kernel coding style by adding missing spaces
around the '*' binary operator in the init_channel_set function.
This resolves a checkpatch warning and improves code readability.

Signed-off-by: Mohammed Momin <linuxmomin0@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..b821a3a1d552 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -326,7 +326,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	u8 b2_4GBand = false;
 	u8 Index2G = 0;
 
-	memset(channel_set, 0, sizeof(struct rt_channel_info)*MAX_CHANNEL_NUM);
+	memset(channel_set, 0, sizeof(struct rt_channel_info) * MAX_CHANNEL_NUM);
 
 	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX && ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 		return chanset_size;
-- 
2.54.0

