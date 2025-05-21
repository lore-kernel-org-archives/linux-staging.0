Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286EE17C21B
	for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843727; cv=none; b=Ie7XexMHAlCBaSAG0fkR0gk312fG6OYmLYdZoek3Xxq9cmrxlo/W8NResMRYvlPWb4dnaaiezgowowqVGdoXeHef8myaV9z4JVsFHAJjlsm9ETPlbduwdaIDKDHQps1KBIQUn0r0WvmbfGNspghJEbW2JJSW1e6/4hpVGJjZfS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843727; c=relaxed/simple;
	bh=GYmBRcAK/FeEY5frsVAXpbsVxVjYCuxDnfkvY7Ngcy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIEjsRI9xwEjh413mrSWZUniw6WjC7WfRy3aP7WlcyGFMqQKPZrUP3k1nutEmxwPl8hNVPy8meYT/mCKh3uY0gkk3cabSLr+yF9m597Fj5DoZPi6EYPX3rx+ABgEuMAg7v7a52NhX1HOqGMqPzgYNytVx+R8V7Z8IU2rajSkO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjBegPM6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjBegPM6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36e090102so2159995f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 21 May 2025 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843723; x=1748448523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dUG+vkFh57CR3B/+EqWY3NGOAXvFGC6HaBPuiNipVwc=;
        b=UjBegPM69Z9ES7ldgEz6rCQkjofrIyhcYRfSVAWkiY6TMusp0lJNZMWK7dsDWXboTs
         Nwyn8f49hQqLTIUOgra6Ks668hXquzPJw+12liyYhXMTDHJpwglyERWVFwn6sXaEg+qu
         4SHB60oTQAEfga8U57rzZoYLd9t+KyLqUETOFnGuIJMrpGpLgUB323FhfssIGT61b9Y+
         LTHZfLxWBiE4fdhueDzjVKmGS+UKhbKSpRR3ZHLo+hXpq22TeWfWSvLca/oGmkS9XvFH
         XqYSYx4XbOLwPHW0P4f2TD4AaF2yHUo7evGcJyjpIUUTT2jZLvBOZ+lJOisaDnbrp3sE
         LPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843723; x=1748448523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUG+vkFh57CR3B/+EqWY3NGOAXvFGC6HaBPuiNipVwc=;
        b=a1m7UnxezMJl7bZcObifx+1Mag5wDCuhh8x7g1snbmZYfJkyWqOIOmXvC0qbXPal7/
         eTdi17gV2zesjgoDXZcT7UGRoy98ufhRNjmAno3D6QgLfZz8AXeHgRX71INxGNjwkJq8
         WpRyT1XBrbFrd2vb8Ub5bz3WYrQZwVD8ViQ6KgVK1zdRDYLM3GJZbDDZvF0eLbLLTBuG
         6NlscG+D9CdddLARunGP7fGPgEQ3LRAZQzGvLRYk6p31HOAKFFAi2rzI3sexmAdf28+t
         4kgxT2xQy0WVCSFPgwFXJ6stcuDsi2sE3V6eT/Y0+U0GXx4xlnqebQAQLvcnDTqxzRCp
         GXbA==
X-Forwarded-Encrypted: i=1; AJvYcCWVjlB66q50L/yl9gUOsIc73SSPoxGBq8cT0URtn/brp83kdW39KfF1EuA+Q7wxIKuk47Z5qkNqT9slcSPW@lists.linux.dev
X-Gm-Message-State: AOJu0YwcEMfhi3owtQesuAw/+iDWOBNku0bcmb0z9i+VGTwXs78Yy5Fo
	j6kiNLdze3C22w5Z/r+5kF2906FRXNzV7OJ9eIFtVa3pEoXhQG+3/JMmuSMETU/e
X-Gm-Gg: ASbGncuxO1K+Bxd1LxbUOhqtApUv+3YwM5i7LWL7jfmc055wswwevEge8sI2QLY7Ox4
	asqtX0EeJ56W8v5vKVkdzKKJ5++6iRhYxp+TMpmQHOd21H7a4yBixMhQDqEWpvNCf8ajHwlsa7Y
	wICqKfxW/3bzK+dzl7eax8oBINT9bmbzn6esdgGi1xw81FzXyTrR5P+6wSv4DhT7j33uqniT05L
	x5J5pJ0rkdFs2vlOfYGqaW0+wu9E+GEGa10nob+xVtZK60UJ4guvDKsOi74Z98zh2rnCzcvaQX0
	I+IBf+1LC0V72kZANadZqugLh8Zhm9hTxg8LKWdZPX8xgn65jLerjfuIsKOmSOwEDV9gkT+UyrF
	fKzvEp1+siug=
X-Google-Smtp-Source: AGHT+IEDrfBSfT8XTPUz2cWYZtcwP4Iceco1mJpPmtVOTs4DkC7/5ymjq3xKUnLDqO8a5wA30Q5LnQ==
X-Received: by 2002:a05:6000:2403:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a3648e1b9fmr17758891f8f.6.1747843723050;
        Wed, 21 May 2025 09:08:43 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a37fb452e5sm2499514f8f.20.2025.05.21.09.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:08:42 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Update TODO
Date: Wed, 21 May 2025 18:08:30 +0200
Message-ID: <20250521160830.30454-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As we no longer have any drivers depending on BROKEN in Kconfig
remove the fix broken driver line.

Add a list of checkpatch checks/warning that should be ignored.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/TODO | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/TODO b/drivers/staging/gpib/TODO
index bf2c39742548..ab41a7f9ca5b 100644
--- a/drivers/staging/gpib/TODO
+++ b/drivers/staging/gpib/TODO
@@ -1,6 +1,9 @@
 TODO:
 - checkpatch.pl fixes
-- fix device drivers that are broken ("depends on BROKEN" in Kconfig)
+  These checks should be ignored:
+    CHECK:ALLOC_SIZEOF_STRUCT: Prefer kmalloc(sizeof(*board->private_data)...) over kmalloc(sizeof(struct xxx_priv)...)
+    ./gpio/gpib_bitbang.c:50: ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parenthese
+  This warning will be addressed later:  WARNING:UNDOCUMENTED_DT_STRING: DT compatible string
 - tidy-up comments:
   - there are some "//comments" and "// comments" scattered around
   - sometimes they are misaligned
-- 
2.49.0

