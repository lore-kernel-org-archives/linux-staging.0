Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848925;
	b=H1/sGbIuRM9J3u+2qTnI0Jjdy+XTQ26e/CPCceKa1rNic/yofsTqeCVCCgosFr5ovXXU
	 4IUedh7tSvXRZP6aHcKCWVwMk3LYB1tDWEABxbvLKJ1sZjLLG4fuTLth5SXN+/Z44m9/C
	 w/mFYl56gXh9flz2cercIixl+LoBIUgO8NHPlbDH7BIsjg3Ub/wSK87fdUeOE4TUoFCsE
	 b+0qDkSPjP4JSPeJt772ovlWlDkRZyd8sjcMyzVD5F4lusvC/H9e0ctSKsx/UGvTVlg1/
	 KrjD5TRmapRMQ8bJQKiwo4ZJ4M9Jgh5kMeJTVDbHMXE8Se1iS4nJMmssxzPHk+zsdQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
	b=MvQyTEemrfriu0xw8BpU4rTWDFswsZf5UWSm1SW0MnWlz0QL9G7b5BLbVdRB0JJUbam7
	 1SkV22MUfpn/SySpp0DqpjTnGV8mivZhp7mPCcj8t2wytjdpW9u5Z6XThvg+FBG8meB6U
	 rfTUaxqgvNemEHZAb2FuAr7DKtCMq7mwt+VONaA0ADZOt5vQKUHKXTeeNTrIK9sqAjCg7
	 X3cQPMi6j8Ya9hGY43v/3sDGhx3tStSXfE7hcTwtr5CiM4Cp7Z/Ri13OzAey+SVfSg5gU
	 fPjLX69ao3tsmPAAeT1IiHyDi3+zw6V8eW5fhAhZ6RS4GVyYx3VnTBQkc5XcV1oNEaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpfUkVux;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87942606A32A
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87942606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpfUkVux
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso3762077a91.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848925; x=1795453725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=gpfUkVuxhrc03fnIQ/tWEJ2vDPwl/nw7K4m3kLTDKbE6+78IccnLXZSMD0TbyQQ3f5
         8PNYDAkGia9kJADj1gMYUbtVzGgl8yOXEc/Qj4oVRJx+2dcyYyNquUcmRr6Fwptm+Gqu
         A4wDK3sMhUoW1dvXZ34KTuVItzWNBhB2AV+KxCpQR+h9BZGJd0fFquGkaClhrSsF1KVB
         wHWsmPywLf9RpACenp8/kN2aPl10dmvOCtDooYQaXA3vVUc/CmNrTDDF6TeFh8YAOYgI
         ZEQdz0Qnvk5VrbvLdYXTFTCM5+wj3U6oBxbbz+EcsOGiK4yBVzfUp+EDZQ53zqV+FUyi
         NVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848925; x=1795453725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDIoL1Mdtc5iZZQDcJSLwb4fY5hsODpxKgBTEdTd3vY=;
        b=jfmpQzxmaF4lfdhPtoBfoFs8pi/HaSOEYl42Gz8UquIRfWDr46pwLgHEdCx3jVzmzY
         5grgtSmybP50gFdh7SlasJg+TFnvAOhz1LxXebzumLy1e/IZhtBnuuA8v83JTd+xKHq3
         Qkw0GUvS7Lw+UKXoR4hu0iw01TV8GhSJIHgB0aNxwYYEXkTKjn43uHjJUIFG1hXRWmEe
         HKSZbufrKuQzm9gnusavGred07z1efWQG/TYF6aqAUCDrw6nD3WW76aqQbyAddsJauu/
         MZvV1Hd3nj92OPTeSA9FyK05S8IulFK8GdcWSBgE3OE4RwuAOrA2xVeR5I4HWxd9NYys
         wapg==
X-Forwarded-Encrypted: i=1; AL+hErHJTdv6Cmj1sG1ooZ0refklQi8V7LqiqFHvkfSWqhXOMPlX3uLbgJ64Ahktk3lwxphy5qrtf3x8TeTeEtcF@lists.linux.dev
X-Gm-Message-State: APuU4Z943YSjcbr1foweYn+AuU2lHWepFsOTt6XZmRs0aDICBm3LG43V
	IrgIWolC0JyGPro9vySh5JMhVIUBiqOU8lZ9YS+WtSWbIRwwxsiQTkna
X-Gm-Gg: AZFdTZdl51sv/fIVeDwxKSIKZ3mdB8xx3iLnXoFWMslVkNrUiTquRLjjPNV/xvzXy5o
	HZjyzfbv45sUgQ4u93W03Kf7JH88Q9sSM30FuwbODKU0tAta4PPlyVOsKRMlpxCLMi21RVrmKjI
	SqGGV/7s1ZpTNxXK5keO0omNfjsuP+jSRN6ZPhZJX7uvQZmdC2idx5CdwIFJ7etuVD7uLZRdYa+
	stiAPGzHVBtLbS9Uo/WRsMVV/43op1q5jPuUggwicM1lXIjNhM7YUZLg83iok2n4XXFAdARivn/
	PQuUKFHcnPXjfGVgqvkoERF7Z+KaXgJ0iTaZuUxpMPJxN2apT75TLqfjfr4neIJrzFjUnkxh7wY
	Zmt+5THJ9zfAIbidgAwfTyRj8io70GwmR50QJrHM999o39c6QzNDvlaND/UsiXQsC3Jl9NmQElh
	djwu63qeO7LgYEndfoP8BrMYK4gDIa/ZqiuC3RJ+mHzQi6sptaYYtkNjrFACXjlKxoLsKdZrXdz
	KU7wLRl0bWcjQN97z4eBscgjDRZCs57C7ABiQugMfeUEsjuoSpK7NT0+JyyHQ3iZ7pEd1hElCOH
	adFQoDek9GMEH4t5F0QnxeWNw9y61XdBn3wlledR3Z7eOTJ0cgL5yoI76XXwy1bWgSheH8ePhQ=
	=
X-Received: by 2002:a17:90b:3146:b0:3b0:9a13:c5d5 with SMTP id 98e67ed59e1d1-3b1b0b57dd8mr10208977a91.16.1794848924812;
        Mon, 16 Nov 2026 09:08:44 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:43 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 17:08:13 +0000
Message-ID: <9afbe32e2a98cc194d84f26e6fcfe452e2b09e5e.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..5dff2edb5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -262,12 +262,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 	return load_and_flush(virt, data, bytes);
 }
 
-/* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0

