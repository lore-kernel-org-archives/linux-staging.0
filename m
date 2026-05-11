Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E4E45348D
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521304; cv=none; b=HSxgVUilSGmczveag/ksM1Ra4/QF96tcyfhTnhf+VwBHAVE/8Uvuy+U5PrJlFV9lw3cWVum+SWK9MQGXc3XDpTNmviUKZypQG34+Cbk4MeLI82r09EBSSxvD/b1JEv6VSW3l2ZUaJT9hiUrfXHYNKTLQ34ExsSkqF3aNd9+PSTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521304; c=relaxed/simple;
	bh=qWPS7zVfWCN8gqT9vakhG6D/GihbJcj3BJGmIISQYFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ST4qUf9rqZddNzqK9BwZno2ILEHBGnp5q17fPoLSHsaDGJovk/xVSq3NHnempnAYQc/3GFBh9VdYGJyvMV5YuhBOSuiCIDzIyd/EEHuhZ6vbpNygiZW/B7g/rJNIKPgtFdewHSlkCTIVsZWvpIEK+NYd2hZGNIzAcrGmRO2Ph0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA9dU0Sk; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA9dU0Sk"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso7652364eec.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521302; x=1779126102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmLP20p+fduoLBEBjHIPZw7SuQQNQl64eCHRMLy2w7o=;
        b=CA9dU0Sk9tmnpTgCDegdXkwBtCFB0SvVvg944psVP/3dPeVbhrZrJ1awMh6SsFG1GC
         iOY/O/IHae2EmOyZ+F58NE7ssOR731bERKI+pTY+ldgx9+9qTa94YWm9iADDecmn782K
         z2ghgtUwZZO9R4btPq1LwrVhuZLsLTXzAEDtoPzDg4hOAbCYlk/tz7R7nV9h28Ph48To
         M4z7WwXF1ELHZ4hVUFyhEviQwGrV6y9UGnOwSA34xb3b11A9JO9TVF77KqB9n5hqddUd
         Ys5K/BrxpBuF7quHKXXlw44SN3TF8yEg04mPcgQAp0zJLQmS5jYUeH4JWwE23IXJDetH
         mTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521302; x=1779126102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmLP20p+fduoLBEBjHIPZw7SuQQNQl64eCHRMLy2w7o=;
        b=gVqVD4J1rdavn3nUauO5Wmuoxn05UI7VMm1G0e8Fri6tj4QXGQc0zDpMryznbxiI81
         VYLEoW7siGeaQSruktSnHCtgp+4Fx5h+eRQeqvcJsdfIKtYCLVnyUGWq3npSKmjviP7w
         3ae6KVkp048d1QHWzJzus5A3L1noDaKgGTqqkEGBhycEpGCTMdzJ6rdBQKnzK+KuRjx1
         dQKhrrjomsed+SgWwvveT3k3HpBBhlAH6gSOPUCjSKwzFl2IFFoWa3ph2DitQwyf1jGt
         dlViB8bs43gm9wbH3TA5W9OblOdGZkpTNBbJv9no2Eb9LLRCcHRzp4LlPJszYFZQuwBB
         T7HA==
X-Gm-Message-State: AOJu0YxBe6/XzBhc4bmADaTs78Ot0K7bnCxvlIj4UIcDlY8FLnShnXhQ
	476EL0MMMnKYiX8T5mzu+nveUSc6cq9QKecMKuVQHiWJa4/36DSCicQoXrhr8g==
X-Gm-Gg: Acq92OEyEZtAgOBK8c8PWrLP0eIcl2RNa/1s90PV0LXxDttrCMeJiEM/QcvcHXxeIGs
	H9K9sHY9EZmasnWQQbQIysQqp+llxpPd2Z8QmxnnTGvAJM7akBl27su4Rf7emC4VKeeXj5x5xzi
	3AnDk1tirRKUqiYulCfoUI29NFjryPx2hIUlqYID1JnAAEUBqmqeRyI65Mja7ExKiF2EGjRq4Dc
	beewRbAwhJfrbKs41ebsB1BeQLf9xFpkxBRGvfsyphXFjp1C3AWkMMYUCrRuHEmVF8IMPjj+pVc
	hta2mf5gtT/xA+qfNaJRuay+9AXOAb2TpnGPB7i1Ng9DzRCZ26dqnqbUCv94cMWqvjZyP4MNfNG
	2gjQZaWCDsEMQmy1yoZvoswPX4S4DqAvt7USCCGUEV5RKiWMc1jRIn48JXVR+1CgR8oW/Ip1fux
	PvLi+yVzE+LswmhTAnfoZed+5Yf0/pkVFK
X-Received: by 2002:a05:7300:df4b:b0:2ed:e17:d510 with SMTP id 5a478bee46e88-2fb4c3e427bmr5499904eec.35.1778521301871;
        Mon, 11 May 2026 10:41:41 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm16899550eec.27.2026.05.11.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:41:41 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: rename CamelCase variable setAllEngOff
Date: Mon, 11 May 2026 10:41:24 -0700
Message-Id: <20260511174124.5345-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511174124.5345-1-guojy.bj@gmail.com>
References: <20260511174124.5345-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames the CamelCase variable 'setAllEngOff' inside struct init_status
to adhere to kernel coding style:
- setAllEngOff -> set_all_eng_off

This fixes the following checkpatch.pl check:
CHECK: Avoid CamelCase: <setAllEngOff>

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 drivers/staging/sm750fb/sm750.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d2fe789efe31..659223dfb930 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -860,7 +860,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
 	sm750_dev->init_parm.power_mode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
 	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index a40dbcc2e6c8..9d5d5466a8d2 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -44,7 +44,7 @@ struct init_status {
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
+	ushort set_all_eng_off;
 	ushort reset_memory;
 };
 
-- 
2.34.1

