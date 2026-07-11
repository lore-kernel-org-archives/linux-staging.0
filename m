Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4A3806C9
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767898; cv=none; b=fsCg01g1KGliDhS8+xkuKODxvwLcS6VOj0Po+q+m/LhKMrISr/DoruxKgSey9DLAA2diASXfZnE+m3nc4Dk/vTABkYO44PFy9reEJ5cdnKIKhKUn6Z6yPRNBmDp7+GdbRc3hOeK6UaWM62JERjjjonj9vaH2K9WXYV7fTAbiDkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767898; c=relaxed/simple;
	bh=wBRJCLK6TqNt5PR+YQgWd99ahf25bxxMPE3POQRppiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdSk1cobuDCe/QRWJU+FvC4b7ttSc0yxISuHd7y4htc97Oq9rJZm0QMm0XnxnP8f0iXuOC/AYZPeHx5N5nHmYTZ7CUK/lqJMwN9EAAjapQWuHI2kJh4H3e7QKbRwLzZh9GDMpEP/sMVdtug0pSrjK1hQ2jqoN7kOTj4KPizDZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmjL3WUj; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmjL3WUj"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so1716377e87.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767894; x=1784372694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lO/PS92+hnAQJB9OLkVZCTdNK1uV8XgtWZyPzd2I5I=;
        b=BmjL3WUjs3ObY2C9NDFxOhldaP9tKbMGHFygRT7rv8TMYRdLqbqTnQPtMiWpk6L3X4
         1JQx0Ea0gBv8kOkNGtFXwLm78ja9FXTte1Qma8KcofLJq2eb7thQUsGKvrWexGn5xPcF
         Z9lWDflWMp7pO1g/zsQgDnl2BeBCDR12hol3g3D5h+iKDmdaRrZE3EA17M9rgSMoTYhT
         HG+uh9VAsFSJXNmv1MVLIWtFLmCR1m93o3fICMVDOn/DQi2VGNNOt9zF8bgPT8K11wRS
         WGJ7gn12kWQgE+73aDe1WAiVg7I9CoiwBTIfjeuXCbG0H5kktKUNqqF6UukutUmaN/wT
         lWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767894; x=1784372694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lO/PS92+hnAQJB9OLkVZCTdNK1uV8XgtWZyPzd2I5I=;
        b=NJ/iniobhAFfwadE11jOmwb/iH76eh4Pfx9UDl9TTb1vz7amwtZIMEJ/PRj4uciEna
         mLU3X/MH6GASNEb21yj4iUmZHi2lW7KCZ8biPEVt+IR0bjiSuG3RQs1+YBOVDTxU3ZHc
         59bVRhkVfPxebrqsWM+wLTmK0fb1c1Qt0cWbtGNRM3qhYPDbMu997XkHORO9JZ9vnvWu
         /t2G5AdGe5AnlVjxqHoyliAIf8/U1G4FPlXNY8Q2cmL48053y6t/Anm8UOLokvWg/G5X
         r93pJbdCj7w0A7jH3AbJGWLzWuyO3IbdBJYUT8ujEiF56UeQJZpFrVqCAORC783WZx/5
         3Heg==
X-Forwarded-Encrypted: i=1; AHgh+RoZfa38tRTvuA3yRcGLale5+qUuJuR0pwq4cnkX4W6+grDOIzhjmQ4CY4LzzK+BKvufkO/b4VB8m4xYz9nO@lists.linux.dev
X-Gm-Message-State: AOJu0YzH8TtJAV8YVHgQkRuGuiv277cMLI+EdT0+ddp70lVPbLwEIeI4
	0TFY9X3Jf5sWhoMnEUjVYPGrXH/3WVlPGMRMDQPoL4Gyti2DFFech+YJzqj0G6WY
X-Gm-Gg: AfdE7cnMYNYroAx0B/vGoPVIVFH3zD63ccU8VVNJRVVqURkbE7L2Fjs3GKuD3JBVgtZ
	7RFs/VnkQTNFwopYsulWwyJzIKIBh8+hcPoErrVvO1xqO4FHjVx0GRRACdBAqaYxcrCMjBJ/iqj
	zE9xlZi81tTxMKbgoAe04siHg72cStMMJRk4ul0b+SZResEFZy48RWRqZsNjUGZDgh891VuP89u
	MJELOEqItGXhY8NFuI1OeXNpT1l5QUBHZH+7wzSYHOCuqlgEXHBvCplEIQt3kphrE3t0eunhvI1
	Nep50qQAK0MtqCP/9qV9DYq7U8TUdd0yYoQwaheBMV5ADgZpUkf+OM7AgewXaCNEJ2GVF07BG8M
	B9blO9x+//pQIYNKtPcua1NpMet1X7Gv4bft3Xvqzte0HfrJFaaWh+4nu/eHUGzCeCHKPLtiK
X-Received: by 2002:ac2:4f11:0:b0:5ae:b4d5:6e5f with SMTP id 2adb3069b0e04-5b0236c1866mr738062e87.40.1783767893738;
        Sat, 11 Jul 2026 04:04:53 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:04:52 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: remove unnecessary return statement
Date: Sat, 11 Jul 2026 15:01:51 +0400
Message-ID: <20260711110152.66188-2-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711110152.66188-1-erqeon@gmail.com>
References: <20260711110152.66188-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..81d0afae8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.53.0

