Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4631F9F70
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 19:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170122; cv=none; b=fmSGjihY9aI52gC7UlvfGCFVF0Sq96QLLcmhVJEhFJiVDDI4gJwdn5nrSgxflW9Q6LFpkBkO+go26l5lW5V/gKlRZoPRmEBHnJgr52JxNo/2gMPKTz0F/k575mbXDchUY7v9Eg7R6GqlU4v0WBOk4MqzsXQeShH4eNLqa57QbyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170122; c=relaxed/simple;
	bh=khubhR/tz+wkJW7Jgfi+FWE467NphcnP8NrRFjYmM9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPLTXab99rEL7KaJw2ISXC5LveNIB1mDDpCTYCDj9Fl3OnsPzGantIf7sMDTyo+OCq55rzPzjVPgL8Cq0rdMyscBVzH4/744911NZsMdF7UXRPUwLCUP+/b2MW1f5POBgK6Qyuq7CHQ5IjEAdIgGA4Wpwyss0jdhFxhRfwrPSx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3UmJuiu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3UmJuiu"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a107b387a5so8544331e87.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170118; x=1773774918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kBsVHle5VKFIOQ+pdBj/KNHoPC/WhiJ8MytokdJrbQ=;
        b=i3UmJuiuYyeXrAe07gQKBQBZ5YKvxG+QYb+u2uX4p9roabwxsb/5r1yo6beP9ypkk3
         QzUAOxsPLkvgPsuvG+eemkj2F0yjOWkx0ZmmAlcqXiz1drGl380FzGNMQHwFW++j1CPN
         USdyb2/YmuT6ZEjmB76jgjv4J/BpsE0GZnR5dXSLepESqaxHqnXUxBz3xHSIqCZtgGTC
         rj9TydD3TwPQO7NHWKHFH70XB81nTTGL8pnZNUs7QOgOHHAZekr7mkHi3FLIdacCxNx2
         mC4aDT/uKtgyJOrhcq2TcJNjPS0r9mABbKNtm7uB7kwRr31fg+RJoGC6TZYlRbzw/HgN
         W11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170118; x=1773774918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kBsVHle5VKFIOQ+pdBj/KNHoPC/WhiJ8MytokdJrbQ=;
        b=aYljByLR7yrYaWJ1FmUKswlPbteFYw4m+4aW0wjyIlnAZ1yuQ2WZ1tWqqrEOFt3RWn
         v36LWyuBFKGNbaDUIEGnpGOVRgfjR4yyKpkevuG4wSfc1H1zIRz8ZJMc0PqQFI71iUil
         4MHzaJu6SfTmDHEdZfZDHQHmyyS/QA1W+Jdi9NqJiy11J/VR0ekCzQHXSb6NTvKGDO+w
         pjjL1davpt7WF43qjAzpLQMJvXG+Y49NXLPui9Iuirq+XAP4JBmEY4nQyPTo+vfJz/g5
         HUPXD4c/dxQohfR5tjgYgX4ZyFPAe8bjKSdS6KjzDYyMk3pwemIVrbRi+ZQvPKj4GX8W
         jI7g==
X-Forwarded-Encrypted: i=1; AJvYcCUftEezjKQ6EXCfGZCT/J4OSPbFjQFWs0XGY7uFFaV/5n3Rh/Or0A75cC139GvuAZrQ9AiJ/rgiN0mkVQAV@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw3JaN/vJdJ6zlFIEvgIUGH3HSxnBonAvkyO8MOmEPzaA3n8jb
	5El/hwKYl3eqm7ZMMlvsroHO6mdvDuk00/403qvogDeuQ4URaryhGUcX
X-Gm-Gg: ATEYQzy9CRZtFXdVXldCevKkZYKufaYuBPNYyLYr4MgJr9kKr5PLpztY1NWE404nB/+
	0shyRf9sfG91A8yvbHTSHRwluBzwHkm7xJAnHf0n90apSqTDJ1V62ys+90z8PTHYizku1eE6dZA
	N90kIBpF0y+xFKrZuFhiUtnbCbp4JKcQozEH9zE7BedumY3Bpcf3l5tvhj3COL8RnSum3dwRAJJ
	3GUgfClKlU+vm0cWx1UeK83pmf2ihSZTGfg+HsdRvZJZ2aidIUPx9iYbUz8grKcWhqdORt3vAZv
	n7xoyhRnFPwf4jWkg4+J0KECS7AoX5eWRYllhfS1a//LDrIOgBzewg98WFHMWTXo6ZdlJid/7Pm
	cPafnH6RWdgk3sZieeB2tFewxcjkNrUd2Zz2MO2J+INfYC/kjtjbv6VKYXY6Dalo4xJL5vN6qql
	QzFXqRAXAn+SG6gCYM+It2slnEHdgzpVxmeG8XX0PxQX+SmzwKSsv8WaXL88QgwXHgQKCXGnJkN
	g==
X-Received: by 2002:a05:6512:64eb:b0:5a1:3b7d:6959 with SMTP id 2adb3069b0e04-5a13cce1786mr4174877e87.36.1773170118122;
        Tue, 10 Mar 2026 12:15:18 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a154269e00sm34271e87.10.2026.03.10.12.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:15:17 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: fix block comment style in circbuf.c
Date: Tue, 10 Mar 2026 20:15:02 +0100
Message-ID: <20260310191502.1354-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310151620.905-1-rayfraytech@gmail.com>
References: <20260310151620.905-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting to comply with kernel coding style:
- Move text from opening '/*' line to a separate continuation line
- Add leading '*' on continuation lines
- Move trailing '*/' to a separate line

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 .../media/atomisp/pci/base/circbuf/src/circbuf.c     | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index db0b76ea4a29..51bdfe64491e 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -186,7 +186,8 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
 	return cb->elems[pos].val;
 }
 
-/* @brief increase size of a circular buffer.
+/*
+ * @brief increase size of a circular buffer.
  * Use 'CAUTION' before using this function. This was added to
  * support / fix issue with increasing size for tagger only
  * Please refer to "ia_css_circbuf.h" for details.
@@ -205,7 +206,8 @@ bool ia_css_circbuf_increase_size(
 
 	curr_size = cb->desc->size;
 	curr_end = cb->desc->end;
-	/* We assume cb was pre defined as global to allow
+	/*
+	 * We assume cb was pre defined as global to allow
 	 * increase in size
 	 */
 	/* FM: are we sure this cannot cause size to become too big? */
@@ -215,11 +217,13 @@ bool ia_css_circbuf_increase_size(
 	else
 		return false; /* overflow in size */
 
-	/* If elems are passed update them else we assume its been taken
+	/*
+	 * If elems are passed update them else we assume its been taken
 	 * care before calling this function
 	 */
 	if (elems) {
-		/* cb element array size will not be increased dynamically,
+		/*
+		 * cb element array size will not be increased dynamically,
 		 * but pointers to new elements can be added at the end
 		 * of existing pre defined cb element array of
 		 * size >= new size if not already added
-- 
2.43.0

