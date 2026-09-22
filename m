Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A68A55D872
	for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087345; cv=none; b=RsC/KZPdKihbIuH4kOYy91jlbpqMdiAWAs3tjxaT3Tgdkccb613C7LJkFnQCXQRMq2LJNpSZE/WC7sUp/84ZrQgxfnRezQWHAiSJcSGqaxh1P/nq6T/HCWlncEzRfkQNja/2ozDkijgNs404re7dGwpoHUoMA3g5sX0785X7d7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087345; c=relaxed/simple;
	bh=c7JTgkgxiJZzFcL8GFK3Qn5+caW0zeCIOU8xJz6971E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHT21DGswVPWhf/Xfhew3OVVe0i+QtZ6ye1z9j9Boc6UB8kVDXVNYETy+AFtqf9//uyVqFN6Hc0Y59i59CqMJGulAKq5qeHv9ApkKAXpa7rZ1dZaQ7tTrA4TTxppbiP23CWazdZD5NUogf2uHPpT35qIgOpIvHsgr+YHjcadeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0pBJiNU; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0pBJiNU"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3dedf3so2610094b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Sep 2026 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087343; x=1790692143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeGWyXRyZoZYh2jsPiBOqtY72lLN35VvTEYYsvF2fT4=;
        b=Y0pBJiNUoM1+dwKXM01PJbjL9607WK9HZW2saXnQSA57wAl6mqBzKg9Csq9CVDRkQp
         FUHMp5ZLJjjb4s3bqBFyZWIug2D1T+/m0IYAa+OviUp+wYXChnyVD+k4EyG8THg6NUBq
         Dpw+7HEgE5I0f6YAvMcEN351aRf/KshMH4Gtwp8BD7Uj2HiT6Cd4rgaOfanisnzuq9m6
         6+DHYypqvzm9jp9xEwL0hDcI37Bw4ALv2mYSKjAShd8IxcbrdKImzN09aYAFd8fL+tZu
         0oDS3mFnbjj53Dcj9Z0BGa/kYWbRNNbW7OO04VXn3CmWikAZXZhxjD0GLKy7f3TIUj2B
         V/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087343; x=1790692143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeGWyXRyZoZYh2jsPiBOqtY72lLN35VvTEYYsvF2fT4=;
        b=ES6GEM2hb4tP/xZk5rWAC5ynUXm+w05MHVVJTEZB7538bRAHXiGNocBE+1aA9Ce3qI
         kNe6TpEHMw6WA1vWfVKYXgNCqT4kUyugYThqbgF49we7iGdWt8939dvZO6bfxHIl742c
         lKGnri5mxAfptAP94npbN742Nk7/RxVcY1lSlay9+IlIWukx+hQ1BqpZMg81hSJxgJvN
         UK+s85kgZqnfTj5ng7mbiLOt/pUyPpB7KPCFmeWEiVkolRv0h6poBTci0LGOEM4x6zoS
         +weXpp7fOJyEx2Uh4AN5RTNBhblSyyFEyc/U+QfhhFgSCa8irSPc3GZTrwtgJd38W8M0
         PdBA==
X-Forwarded-Encrypted: i=1; AKwUvBzvCaqbAeJn80yC3WRz5tt/pTTt+MchQUFWmQUckq/L8cX6pbSfwmp2GW5LZf87l7hTVLIV9NRVdrQydtTl@lists.linux.dev
X-Gm-Message-State: AFuF++mgPmSMiGDK+I2mN9ojZgQmW+7yXlXkMMvvoC3o2kOnHM5jUqPT
	vCDKwU0jab7h6iQCadW+rt1TunueFItkk5LwKKLA7Hf8vtavMdDSf7cy
X-Gm-Gg: AYBFou2tq8TL/gFfJKguSCp+0LmksX9fOVrJfG0hkGY8ej0ME901AsAM5ZrVKr9npJm
	zNWRzsCBJMi+JIy4jSvlxct8yleSDFuaSypohknN1r7TBrvrXEUiBPslSUv6BLuAL0vJZdFBiQq
	YLL/gbAHbBw/rA07RhOsDgcXTMoTenEr4aeU8N2Hyu71RyX9oi36R4TXYlMgQd83VpAarcf7qbJ
	MPGwOs1E/LZm25fbUSrFCMOnWF5zBIpv+rgRa4nZd/c3wTr7PuPV3ODMFnOZRrFOkXCGgO0Qust
	lhP8COwIP8xAs9ygid3IHRpt0CSfQRBIywS1oNneArB1k3Y0YXsS1GqKb9TjnWUMPM5yvo1WI3/
	5pRm4E9/In2fB3JJFFYs8DETpA9bjNT4XXDBrb59VYPCCagxo6Fv2+1B2Hnl1lIKVs6y9ispm7y
	Ip5Y9UkOuoZZg/QayQP4C6Z78cGGCgRgKJ865UY3W997/BH0s5Sab1kUt6wrFu8sMOGhMXUinKM
	HjAOCzsYlJLkJHrxArqprevo2lhGfOHugaOwBS6gABgSnQhchkKhgd4dhCfP4msZNXSAbSgA9S6
	mFDdX76MfJNYCfJ8Jbsxn1roV7UFzpry7llNCl3UTnosy+D7bo1QOZudaw==
X-Received: by 2002:a05:6808:30a0:b0:4c5:4eed:b447 with SMTP id 5614622812f47-4ccf6a74ebcmr15126478b6e.1.1790087342564;
        Tue, 22 Sep 2026 07:29:02 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:611b:6da3:8cff:cdf1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d4c0dd2244sm1467147b6e.8.2026.09.22.07.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:29:01 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>
Subject: [PATCH v2] staging: sm750fb: free cmap on framebuffer release
Date: Tue, 22 Sep 2026 11:28:51 -0300
Message-ID: <20260922142851.46724-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922035302.167378-1-2000.costalucas@gmail.com>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmap is allocated by lynxfb_set_fbinfo() but never freed, so it is
leaked when the framebuffer is torn down.  This happens on every unbind,
and on the register_framebuffer() error path in
sm750fb_framebuffer_alloc().

Add a lynxfb_unset_fbinfo() cleanup counterpart to lynxfb_set_fbinfo()
which deallocates the cmap, and call it on teardown.  In the alloc error
path it is only called once lynxfb_set_fbinfo() has succeeded, so the
cmap is only freed when it was actually allocated.

Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
v2:
 - Move the cmap deallocation into a lynxfb_unset_fbinfo() cleanup
   counterpart to lynxfb_set_fbinfo(), instead of open-coding
   fb_dealloc_cmap() at each call site.
 - In the alloc error path, only unwind the cmap once
   lynxfb_set_fbinfo() has succeeded (Dan Carpenter).

 drivers/staging/sm750fb/sm750.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 8b93bfeb217b..68b6d4fe79ca 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -825,6 +825,11 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	return ret;
 }
 
+static void lynxfb_unset_fbinfo(struct fb_info *info)
+{
+	fb_dealloc_cmap(&info->cmap);
+}
+
 /*	chip specific g_option configuration routine */
 static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 {
@@ -910,6 +915,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
 	while (sm750_dev->fb_count) {
 		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
 		unregister_framebuffer(fb_info);
+		lynxfb_unset_fbinfo(fb_info);
 		framebuffer_release(fb_info);
 		sm750_dev->fb_count--;
 	}
@@ -936,12 +942,14 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 
 	err = register_framebuffer(fb_info);
 	if (err < 0)
-		goto release_fb;
+		goto unset_fb;
 
 	sm750_dev->fb_count++;
 
 	return 0;
 
+unset_fb:
+	lynxfb_unset_fbinfo(fb_info);
 release_fb:
 	framebuffer_release(fb_info);
 	return err;
-- 
2.43.0

