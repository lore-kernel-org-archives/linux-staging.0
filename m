Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815517C64
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721199520; cv=none; b=Ljrl5971hX/GOceJkd0IO2mWfLM0UjiYePd85vBZZnBMzZZs1nN6t6IOwCEjQiQhgGnVH9H7J+Fxju/eLwl+s5EOENgkDDydMuBtNIQ/Zh3a8ZHilIbs6EVef3DzTHbMQ+ZHXZCPG4vry6Z7BskRKg6Jbk/GmCzx1bcsPzICikA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721199520; c=relaxed/simple;
	bh=tR/7I6a6NZphvz7GKgYPfRysiuvVAzCgnGmds/3ELnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6kZUeKX6YNUuRhRGzjeESjL0VF1n22mWNP5sLfz0SY8ZLp3q7My46LlPi935F/FgX/U90P1HVf2rr1e5beby4nbzv4i1GQXPw8hWyJCtQghcQVoW7R96eN2050ihrKaYmdVJz+VbEe942PXdlBas+1vzWXfgWKmZGuzURJQRUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar55C6Ro; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar55C6Ro"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-80fbfeecca1so314836241.1
        for <linux-staging@lists.linux.dev>; Tue, 16 Jul 2024 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721199518; x=1721804318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n5MI4wA4eNqCCeuCE33RMDqDRerDlDtTN/blIniiod4=;
        b=ar55C6RoY7Rm049+U2eNTMjEAF1HDHLx+Vi6ZoTuUXumBSBpboqiT4/8VF2bj5zXyA
         fmRh/7LxXzzgWU0xTA6rE153xggu1WSchPwIXo/k3mDXRe5f2U8ig5520UUOPEK95OBC
         S/fmnBvInqlMTrLUwFEmXOKcuj+FBsh/lNpbWryBbrqw1c1eUpdVM33EUQ2k+NN2QUZW
         cRcq8EXMB25RaP5+n4oZ/XYw6sL+bODBAL6xCclmT9aITk4unFg8SackYTWNuU1IiaR/
         MjwNl5ybRZ/hyKoY5pATZUq6fmI3agEOSW0CROerI2aKjMFDNurgsEdo7oJ+FwiMLOmD
         MyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721199518; x=1721804318;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5MI4wA4eNqCCeuCE33RMDqDRerDlDtTN/blIniiod4=;
        b=mP8b8Ak3hSLvZXjA84N+TfZgwE+b4CZboqZzoQxf2Bg+9Spa4WN1o3+AX4Nu8gtVyW
         EkSOrbGdhek5jwc9bsGtUrQfzKfo1/xsGu6x6g5lMdCT2rf9yDuc32+s02bYDIH4rtsg
         4AYH9h21enZf8ov3bcu4eHSXl5kJalBSueLcH90waq1Qiw1v0iSDLaOGKeTuqmjo2QvL
         WlYHDBQwTeh4Gkw802LaGYQeYtFl2fntqcyETIEyNLYB9hAHNmY+Xv2ukrAMbonNqSfC
         B6zsd5Y7vqk7YWjs/MnlbfnM3oueK/XCLaaN04++vyiZ/cIwfneMBD5KgkBbY8ICFx6R
         XO+A==
X-Gm-Message-State: AOJu0YztLLfStbMb8zD9UgczreVGwizpMIS5+1gnAYljBTrUqO78sP81
	Z23O/tZ5GGjg8epXYYYOqEC0EztTbvlYT2EHyFWGvIAc8CQZ0/rhkpE5qL4vfRg=
X-Google-Smtp-Source: AGHT+IFJFn/H55QzwVuNHPtKpm9rl7xAFOCWsmfpf0dujwwCbunCOsARF3xBr8Fh2JtdSo1QIpXWyA==
X-Received: by 2002:a05:6102:80aa:b0:48f:e913:7f5b with SMTP id ada2fe7eead31-49159853aeamr817084137.19.1721199517752;
        Tue, 16 Jul 2024 23:58:37 -0700 (PDT)
Received: from fedora ([2800:e6:4000:47e:7c52:7bd4:cfe5:9874])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-491561c743fsm306949137.34.2024.07.16.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:58:37 -0700 (PDT)
Date: Wed, 17 Jul 2024 01:58:34 -0500
From: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
To: gregkh@linuxfoundation.org, pure.logic@nexus-software.ie,
	johan@kernel.org
Cc: linux-staging@lists.linux.dev, trivial@kernel.org,
	greybus-dev@lists.linaro.org
Subject: [PATCH] staging: greybus: Enclose multi-statement macro in do-while
 loop
Message-ID: <ZpdrmuzGgYDJ-Bb0@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
contains multiple statements, which should be enclosed in a do-while
loop to ensure proper execution and adhere to coding standards.

This patch modifies the `gb_loopback_stats_attrs` macro to enclose
its statements in a do-while loop, addressing the style error flagged
by checkpatch.pl.

Signed-off-by: Juan José Arboleda <soyjuanarbol@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 4313d3bbc23a..a97de86c67a5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -163,9 +163,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);	\
+		gb_loopback_ro_stats_attr(field, max, u);	\
+		gb_loopback_ro_avg_attr(field);			\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.45.2

