Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63476226863
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772584239; cv=none; b=b4QB4S8v4wRY2NBA6R+Nqsr3yHanMAWsz3fIHeahr+xDoWf/eYRsVJzdJKr9LYiFwgPZuqTT9hoW1TN74KVo1cm3PQDz2AgtfscolJKYgiD1S+ZPCFXWp+V+hwmB3p/y5JmKi63JPG2MSc0JekiPpTaFFrCl2v6OpzX/fJJuFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772584239; c=relaxed/simple;
	bh=Pwu2/v/UJFYjVnP/Ug8nkuxiULByTSQZO/rj5ld9+8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHeqyklA9PQT3wxqk7M7E6D8wsxgb0DLMVUozzDou/X6TwsNTDhTVkYwb3/pJthNoRbhyEfH9pOP/SazzI5u8EWZprrVqqpsnO+wKdgPtGIbqZROtilf89TcoR9DpGIe75ec8JCiEQETtPx6RRLkIe41ImeMs953geRKh732ykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKrrMRXf; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKrrMRXf"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ad8435f46so5957690d50.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Mar 2026 16:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772584237; x=1773189037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HSXKUaZvJqyghFJACVAxkz2Fw31Nb8yZfKwLE7cLHLM=;
        b=PKrrMRXfZMLyIyNc7o4n+DCZuZ9KxcuFI9WBIy+llm36NwG/sTNGfALtAPxU8YJ/3h
         2DJNG0u+5Fk5o5pi1gi3GjHrBclQPzWQuHAdq7E75VeVWCzrvoyCSryb5si/BgSgH56c
         XG81pTIeYlNP4htjICF2BBSi/wkOOy/GrGibKMEJ/uUoY/Qrexw6tBRHCpWe2oespI6E
         1Zlk2PcDZsLQU16oqP4R1cqxaoKW1qasEZJw0OVij4OQWcGYzlLEqErvJvlqBXOrNfFS
         em2O2BKqv1FmQGYQjX1UOQWvC/d8PyFqQgHVzyLMM2GeEOLLcw6s1/vtTsJswLj3DaMl
         dmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772584237; x=1773189037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSXKUaZvJqyghFJACVAxkz2Fw31Nb8yZfKwLE7cLHLM=;
        b=PQooPtAzA2qEWVmcsYE3NX7zzl5KfCsDLLIhSQfZZHndkx3GF+pr6BsnnmSn8rUvWX
         coImzJ6Ue4j8cYNKchAomm1ZYhDxX2jbKlnq8MS+Ug3E5tn6cqjn2nuPb24lg0XWzOUt
         6zz3eYdOQ2ooxtLkML6D6a7RRfL7pLtiuyo4mHu1xPH26C69QPyM9koUFVftF+Z2h425
         noxMR1cv6cCZQlfoIMhZCf76nDsAKuqu2KKbrTh0n5yhMgKv0pNLNp1/tp36o35f/wAo
         iCFfnUoJCuATWGrr3L/LWhj3bm0DzNMfsYJfuVFbGLAESwZDd+GP3DpXaX36YppvAJUU
         9bhg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9kyDSdsIxWY0bMAsgKoYXNG2/w1AXs4XAE22APWlaNf5oG1Yt9+mlNR60euKl217vLJ45fCTofYVKN97@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2BGL9yQcwoS6eXdFBqCH1BAIB1ym+ELs0hE2VLKFm5qXv4mKw
	7Mwz2KQGq1RXdz2jFSYzKHa8fcEUQRnH9bAa+4Y4TgdX+k3SK5EZX0Aua9DF6PKoUuM=
X-Gm-Gg: ATEYQzzlWZH7mTsCyBxfMp9Cw9H/P9eHAqGr/CYhZKL0KXf8qSsxA1TX/BQZNA5I4Pz
	HXWc/pVMK/UzZYayJG+YYi4ANB2Fdl1bNgeyw+BbLssR5paUg8bskNOW8QyxztffTorB7tZ3Gk2
	G40zQYpRI8hw9/fa5LF3seEx9a9+uxBSSdls3imOb5VXOXwqgFtNVB9B0IZ/3CjCg6oKPfK6c4l
	+4o8dl79EwMEIcxaQA1dyKt11HLIU0HGveIUgKaUhGHrWcB+lst0pR17k9r8i/IL2wGEYNKEjSR
	3h9shm4sBJZQn7DHmAWo9wncPKS6EfctyMKFvokJI+nqvZqrMN3fh3XGhZnWqWsq9dr61/gaN+K
	MSkDA4vQ2M8X3ewgW8DV3MgDIUM0SA/fBly3Jiw4B3uIyWlsWaJ2Fu+Osc0jvs5IOZ4HfcVT9Ya
	Lp7yNRDO3tyX6F6DVfl0vrOhj3oWKC8fTAX6s8eeq7rHdfEwKSgj06G7+2G4gKjK4O4p5vjoBcc
	+8YZczcqvK9InjofXK2CsLE
X-Received: by 2002:a05:690e:4188:b0:64a:e1e0:a11f with SMTP id 956f58d0204a3-64cf9b5bf51mr301543d50.34.1772584237115;
        Tue, 03 Mar 2026 16:30:37 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7626ff1sm7230254d50.13.2026.03.03.16.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 16:30:36 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Add myself as reviewer
Date: Tue,  3 Mar 2026 18:30:14 -0600
Message-ID: <20260304003014.2558653-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create rtl8723bs entry in MAINTAINERS and add myself as the reviewer.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
I've been active reviewing patches in rtl8723bs and would like to become
the official dedicated reviewer. I've noticed (and Greg mentioned it
himself) just how many patches have been coming into this driver so
would be very happy to help with the load.

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 364f0bec8748..05145eb43e7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25169,6 +25169,13 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/nvec/
 
+STAGING - REALTEK WIRELESS DRIVER (rtl8723bs)
+M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+R:	Ethan Tidmore <ethantidmore06@gmail.com>
+L:	linux-staging@lists.linux.dev
+S:	Maintained
+F:	drivers/staging/rtl8723bs/
+
 STAGING - SEPS525 LCD CONTROLLER DRIVERS
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-fbdev@vger.kernel.org
-- 
2.53.0

