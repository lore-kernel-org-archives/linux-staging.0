Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A34C2C98
	for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:39:34 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id p23so5488558uaa.6
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QraEw1MMGnwx9JFyFTABlxndaYwZD109U5RjGzZtJZI=;
        b=iAFPIe9cky/Um+h4fO1+FIa0SurP6snw6pXN1do26C7vDer6KwDZj38nDqJJRPnHS2
         +tmhcJC5RGtdyHypd4k8WcJHQ6pC4pWY7Tit6Fx347a1tAZlmrcgi+k2f2IjNUraKDv9
         a1lbho9OwNpqOAXxfqDNHMNsXA3r+C+MLJBvavUkcHxzWETdu/kfrlcCtFPXZPh9wZ5P
         d8DgS18fIJKqguHXaBYj4J0wEyYpVewHGbbaOorllUq07+6KZiUDtXnVufz3u1U2/dO0
         WwmzcW6dmr9Js3y61NgrBxD96bBJGyeetPxnmOh2W94I+ALzY94e10KyNkTwE0AqTrGk
         6jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QraEw1MMGnwx9JFyFTABlxndaYwZD109U5RjGzZtJZI=;
        b=Pq5Ju6u2F3fNAy7gY9hc525To9cQIFW8tpk+wJxVHHvr9uOddSWvzdSoW7IqLZ7xzH
         JYPp//OnH2GTJ4tQpvIb3ducah2x28wjUNvDAvMWUVnbtaVpXTWbNxKUL4tbGCS6an8e
         tHRuM7ctS73rr/yf3W6qKuwMXuViNpXX+Vuehz2uPV4m291UcK9hgn1y0oOXqU136j1s
         w+MXRuiqAT6we3fyNRGVIYdi533Tdhd6fLaxNC1MipRk9Wxbwu/6cGQIOH08WD4dccra
         z9NXIyDBNQUxUlqSaHFyFRKyuM7al/WxhE2SLCj4t5x/NpgG1wmnuRXAIhH2rpEIrAbo
         QGOg==
X-Gm-Message-State: AOAM532APa0jIHBI9AZ3ruzI+ac9C9rNJnj4s1ABBwoc0pIEAywRi59H
	My48IApc8vF1jQm85zlXq0vR0/YLJtnceQ==
X-Google-Smtp-Source: ABdhPJygE+1fz6v4hPFhXo1k0yuQUD2l0NVhQv2MwZnMh51zGuIEcJ0lcMkm+x5zpTXwoQtuRHOQvA==
X-Received: by 2002:a05:6102:3a56:: with SMTP id c22mr11776109vsu.26.1635111573193;
        Sun, 24 Oct 2021 14:39:33 -0700 (PDT)
Received: from localhost.localdomain ([191.83.215.63])
        by smtp.gmail.com with ESMTPSA id 64sm2046309vsz.15.2021.10.24.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 14:39:32 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH v2 8/8] staging: vchiq_core: fix quoted strings split across lines
Date: Sun, 24 Oct 2021 18:38:39 -0300
Message-Id: <20211024213839.370830-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211024212844.370379-1-gascoar@gmail.com>
References: <20211024212844.370379-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quoted strings should not be split across lines. As put it in [1]:
"never break user-visible strings such as printk messages because that
breaks the ability to grep for them."

While at it, fix the alignment of the arguments in the sentence.

Note: this introduce a checkpatch CHECK: line length of 123 exceeds 100
columns, as the line now is:

 vchiq_loud_error("%d: service %d (%c%c%c%c) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",

But now the string is grep-able and the whole function call more
clear.

Reported by checkpatch.pl

[1] Documentation/process/coding-style.rst

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3af55e78f356..ab97a35e63f9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1499,13 +1499,9 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 	if ((service->version < version_min) || (version < service->version_min)) {
 		/* Version mismatch */
 		vchiq_loud_error_header();
-		vchiq_loud_error("%d: service %d (%c%c%c%c) "
-			"version mismatch - local (%d, min %d)"
-			" vs. remote (%d, min %d)",
-			state->id, service->localport,
-			VCHIQ_FOURCC_AS_4CHARS(fourcc),
-			service->version, service->version_min,
-			version, version_min);
+		vchiq_loud_error("%d: service %d (%c%c%c%c) version mismatch - local (%d, min %d) vs. remote (%d, min %d)",
+				 state->id, service->localport, VCHIQ_FOURCC_AS_4CHARS(fourcc),
+				 service->version, service->version_min, version, version_min);
 		vchiq_loud_error_footer();
 		vchiq_service_put(service);
 		service = NULL;
-- 
2.33.1

