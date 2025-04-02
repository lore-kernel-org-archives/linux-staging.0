Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998213D53B;
	Wed,  2 Apr 2025 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599923; cv=none; b=FuMEoyq/CEdjIC421BInIKNsBDyWDdEPE4wmvpTFW8IrqMT/xJv66Z4AeOYq5rbunWl4eo6cVaOc5mUnYsH3wu9vKZOGKy/z5f9KstPhsXGdn4rwLSNMBw5FePNbUtmRwBm7Bc6IyKCu6CMh798UcZT1Ere3+LcyYlxMErMCMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599923; c=relaxed/simple;
	bh=hTce2fu63vILU+Nv0bLr6fat6cpDQYvpiVdtQKz7zr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bI2S4qb6VYq+HrShbRWOH9rdjez6lLKPorJn7uMtct2JimrhH/E0U9em9vVFFrxxZH89+csFIirrDsBQH3e8s+TWxYo21RqitT0DW6biycheK2zgGgFDe09KZqeNuSbzpd22AKg1/e38WqnppUUz6edRBl6kda38UJzQgVDn+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/uocv51; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/uocv51"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so11767939a12.3;
        Wed, 02 Apr 2025 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743599920; x=1744204720; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8OOW19gYi9GtyeQ4qqZw+eawnXRnqo/rA8a2T8vrZE=;
        b=a/uocv515WhPWsL+5kePmx4XOphPKnWUS22klXaXWOSbVQc693XYbG26EUkNuN9Eye
         CTBjgLfl6FJPhi9LCloJhWtJvwKiYSrrehx+95j1d5bH6NtSPtYqefGBA7bWa/XQ9K47
         V69TXyRzOy2igQQBWlfMesRF5c35VODcfQ1qSEQk0Xp+HNM4UmuZXcMgefebTBp5mEG4
         R7eSdyeTsvmFwjVQvaj0CT3lGZX1T87hugrio4E/sD0shcuInjEJJhL9qD15peh5hIkV
         stnZ9CjXNhtyTAjVOoq1Hyw9bfflqkbpulfPzg5uNth+1JRZ/nx3DnoVgYRuY71+sAnk
         QXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743599920; x=1744204720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8OOW19gYi9GtyeQ4qqZw+eawnXRnqo/rA8a2T8vrZE=;
        b=ZsiZEoeNcNxVPT9b/E6AC7kfytvksKmqkfyLCPrs0bWCrszE1C1YALeSMjqHSCzoby
         ZfA21aMagnTH2utzZXfQoHgz+PIMRpCdYvfawP62kuqei9qtGbVaBxkKIX4nbtEmrysN
         ZRkZpMtT4YLIItguQFyUC+lf//CapmqfllSgvQTAx+Oc37tvxKFh/CueU+3TP/a525mg
         M8VXuZLuJ975pqUrzIHqL/aT4cL/BVdf8gbZH7KcRoPR9SdRpjfMthncI1HCmg8NtyXl
         ZFAP1PgY1t3YikSMJXXzZWB/gXs4/3tDnnH6o7BvJDM9JNVVnyDY8xy8a1BIMJUVaNMo
         Nlbg==
X-Forwarded-Encrypted: i=1; AJvYcCWVfmgOWcGmo2n8DGK01S9W5nG1VF9cXCexiGDwY+VzpJMYtVm2+1tN1Vg9sIR8CYBjzekdBQsT7c5lmnMB@lists.linux.dev
X-Gm-Message-State: AOJu0YwWumzhL5ZBjvgN8bOJectEzilFQucWz/WgMQdzFktfmqw4ft3T
	EpWcpRMAAOTZv3ypnIzvNOhaGUEpfJpBgHWtZqNXa3SG07ZHz87LS4WQ+s5n
X-Gm-Gg: ASbGncuOwu9zvg7pR0wqKoUTPNNCPWpKgU6ZkKLPa/OlqT0U/ofrG5KWbJTjPCRc8fd
	J1JgJ6NFDgyV5FCeucnsORldrg6vPGv0vlc44gnNLHEJbWzIPB5X7xZBnGIBStPL0phaF2C5NhD
	jk8YfMR8cLFrtEfqK6Kb+1l+Jp+Vd+dkr9hhpKiJdSgkKrJE9gfd/AvU/4QVgtwUmJ4gzJsEp5N
	n3h/S5+24IxTFZvFYM24qh5vDNY8kZKv6phTlIZ/JKTeVnFltV52GbENHCibYbS0+1a/7wdn6MN
	UYYxeXy0jRxtRTSlaPKFsgd3A087q8axFafr1M777FI/ot9C7g==
X-Google-Smtp-Source: AGHT+IHFUmrmlc4HA2ylOlLMlHTULjl3M+S7hQguh6s8FyPgenDwQjUTgAyjksCyMnV0khwDxKRsUA==
X-Received: by 2002:a05:6402:42c8:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5edfd13ca73mr15448608a12.18.1743599919214;
        Wed, 02 Apr 2025 06:18:39 -0700 (PDT)
Received: from HP-650 ([105.112.228.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edcaac38f4sm7793053a12.10.2025.04.02.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:18:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:18:24 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: modify struct field to use standard bool
 type
Message-ID: <Z+05IEjV3pczMLNQ@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct field uses the uint values 0 and 1 to represent false and
true values respectively.

Convert cases to use the bool type instead to conform to Linux
coding styles and ensure consistency.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

