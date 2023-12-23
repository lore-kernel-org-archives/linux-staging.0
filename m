Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2A5683
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 06:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAFvjyzZ"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7ba834684abso103659239f.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 22:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703312217; x=1703917017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7njaXclry8FJLwii07+vYUOoiK5EVEJQBJVFl/kxqE=;
        b=RAFvjyzZpPiBqf4rPN2d0K8Kg9xZkQYtNbDsrgHX1KmEyh1LPxDaB1oUDoX2L/mfq0
         FAc7maYKq8ApcVnWhB91Xh0J1X92yFFTf6+qcK+RpQ9hjb9vKKO66/sFWN3I7CKliu0u
         kHCZc68vSsrb98YLcFfogHYPHrOqCH4cqLpwYneKufJ79TsMVQDDrNRKehgiKzKbGcAX
         /uzjq59RUunLKMoa9fj/mAMc1bXsKuohMDhG9NxzGj54STsy1Qv4rnukl28tWSZmgr03
         WtDacqQxZKudQ3iKRoed/VZ04EbfXBIxpqZ9U5Ip/6AHfg0OEqFC4vY8T3VAyECrwKiX
         Mf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703312217; x=1703917017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7njaXclry8FJLwii07+vYUOoiK5EVEJQBJVFl/kxqE=;
        b=WOVUz3CSzlP+ZrCAJWUrJ7l7X/a4I6/EPR8Fs8kaKnGOjM5ABut+faoYROJX6nks6q
         /hyQKvH1LoIah9T8KO8b7zQdZz0GtDdPl/GO1PAAVr0Cs+fBo2DaFckZoRCddCgIDnRa
         LvLibkov+EGoGYYHRk6z3q6OpMCQC8HR0noprv/Qw0xiYnMRWGf0WTM0ulBWJB1puLD1
         IJEL4EhuY9xOulBH6togAd1pwmif316Pxf8AzxJbKEAzo0PEvR6T8kf97/oho80Hgqg/
         g/o1+AEH5npdiRMWse9gkKxWhqkXw7eGXYs9OETGr3EXy0ZRVVrfrwvMUoLFYW9MAVgv
         +djA==
X-Gm-Message-State: AOJu0YwTokBGZbQelQCN4OoNhH5ms7YyBWGjtNR41HwiSQJDEq78S4AF
	Hed50tH/tauIX5iGjwFH0U8=
X-Google-Smtp-Source: AGHT+IF8YJ43SrzDQe7J5DlABGxtPTsbfEZgJo+fSABzEFKyifcAkhaVcjxBU16GO8jG8S++691oBg==
X-Received: by 2002:a5e:c80e:0:b0:7ba:813c:39bd with SMTP id y14-20020a5ec80e000000b007ba813c39bdmr3096868iol.42.1703312216698;
        Fri, 22 Dec 2023 22:16:56 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id f26-20020aa78b1a000000b006d97f80c4absm3024061pfd.41.2023.12.22.22.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:16:56 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/base/circbuf/interface: Fix spelling mistake in ia_css_circbuf.h
Date: Sat, 23 Dec 2023 12:01:47 +0545
Message-Id: <20231223061647.78669-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_circbuf.h as below:

'''
./base/circbuf/interface/ia_css_circbuf.h:76: poistion ==> position
'''
This patch fixes this spelling mistake.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index 0579deac5535..e9846951f4ed 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -73,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
 
 /**
  * @brief Extract a value out of the circular buffer.
- * Get a value at an arbitrary poistion in the circular
+ * Get a value at an arbitrary position in the circular
  * buffer. The user should call "ia_css_circbuf_is_empty()"
  * to avoid accessing to an empty buffer.
  *
-- 
2.39.2 (Apple Git-143)

