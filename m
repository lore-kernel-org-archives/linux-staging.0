Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B03815F0
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492047; cv=none; b=AgYS34C2hwUsADStp5JOsaReRMWirYVLRua/NXGbQiIvUcxWArmVWrs2H1oidzAl49nFqUs2MZaUt95jMUnUnPzTr2abSVgQIwSGgQCNHALLBvo9E0XewDyhZuAoKVhBZXgOTusXGywmKJzCr3Hv/v3rMF2ZGLCeMqQp9eJfwnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492047; c=relaxed/simple;
	bh=Yt/kSWKYgEmn3lnGsotfzUJ++VUPu11YeZ/lRw5fMDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YetgIhq1Dj1QpizMZqZB8qJYqxZ+lbYKMJYPXwrddHk+jUtpP8VEOivx8urR2QsZtdRiJWZQrpIOMOLxUK0+TXhobFcI56HPaQ7zNxtg3f2TEAbquB9DcelTcRhDd8tX5fv1vGyuILxz3ua7q40A5f+MzF+M1aa7UeRPi040K4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=WvPoGw9t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="WvPoGw9t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so3768965e9.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492044; x=1783096844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OowDwQZb1xEXc+FvtEIGezBjSxjwm6qvuwW8y1ht2HM=;
        b=WvPoGw9tNQeuXCyJ2zSqLR9pjbe0oMkwduGUFzTlxH2M2TwXVaqJedGVRCoQuDkUt3
         KjnqsJZQHxy/QY1MkpD1p/tOyWdQMVPeXrTje3ArXBAFND7mBrxNWq6MSYD0QHX9rR0d
         s8yPOZkhcWdl5GrFsvOAkT/JAFWWHne/bZWkPRJQK3Whlza48ygGalqfftyIu4MhqvB7
         DlKyY7aeYM8/VnzFkSL/btoYSemu3X7uuMXeokvbRHKOpp6K71oiprtFlPozrg3Kq4De
         0ENVF+xBs1hCl/0/yJAKb38YjTYuS+Ix8uIxtQVEl5dOq6HjVgCvP+PyoHsCoEdRfZg0
         TMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492044; x=1783096844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OowDwQZb1xEXc+FvtEIGezBjSxjwm6qvuwW8y1ht2HM=;
        b=dtM07rAOFYmXYtFNnnpT5c0c8PlKw669rPPOZfGtsCrEVQoHLiHrhjTuTZLgHZCtc9
         VbPp21sLBP+q2W6lgVZMu59tuwv4Sa+kMTPzREyNEKgCUUVtkxYwAtAQxh0veJxxRAnS
         QJJfvDOKrYJQFNipid/SUjQWJ4QQDjbt6WPZVFzMjhYIYO23COU4bcjmRRIkxcIWuYRZ
         awqUE+qfj0Vo6UogVENO376Z0XZkCDh+/PuLane5sXEAmPNKU7Y5Mep8GLpLuMZfuXEO
         AV/AonhsT7hEYtl9mxaO7+BfVZaYH8I0SJypokQjegWq+bNvS1sVh3j7e02J6kT5bvOh
         ZUsA==
X-Forwarded-Encrypted: i=1; AFNElJ+HrYhCVoxwMvR7EzdNAyfCZDE30w7XgzSYLBHirfNXR0ImdtDD7LR/NvQ7chAADtT+cEqtcrMZzsikjX9D@lists.linux.dev
X-Gm-Message-State: AOJu0YwWU1mKbSM7Fq8sMxjPsw+4TjwDsk+aVGDCJ2Dfg7HorocD4ESf
	Wf/bLRGZpJomxQ1eFhBfNpyn8zvXFhbcVnVLRaq0iL0y8bzkVb9puWVIVe7Hjt1Bya7x
X-Gm-Gg: AfdE7cmj4I7SLLmlibsuTaHmDa6LZGXtozf3ePturyA04mfu/WiIVd3faqoqeOfMBs2
	sLOINjR+D9uMQeY+ylPGfNhyd6zFdIOYpRhntzA5tJ91s6/T5BRJS0mj+UN8Y/AQSp0Zp/awYN+
	rCB4aiQwaekZmAhi+x/6Ejab0h78zQfHeJSZM5C6rH9pONa8FpYu7CcC+2USoq/FzlWplwtiJxf
	un7uIJZeltcBK0Uh3xz1a+TOdWl/oS46a24t34wHM9SFBS3qTs5MttDSSOxjgwkm7E4rZy8/cHx
	uYjiBHP5bUVjUWn05VCubQffSOdGkL0OOvfugox/x7VWE413v5F7Sg6w6rcYtmvYUcPS0xVcy0+
	P79BVEJlfvJbBHvT927tNdify9n0hJxJa531w/w9pAXg2oMBwUgBD8fd9RPbuh0ZDqxOrmfdsN3
	BZ0+EgcA4q0+lP+wsPSjsQSAEoOxvXdnK/2ipCbxig5C1vEDEKBQFt8TixXRd8p76NGPZt1a07g
	+H0dp/kGYd+04sSbpjJ5n9pgHwiXfHuyHw=
X-Received: by 2002:a05:600c:8286:b0:492:68f5:6b30 with SMTP id 5b1f17b1804b1-49268f56bc1mr75194685e9.17.1782492044437;
        Fri, 26 Jun 2026 09:40:44 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:44 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 0/2] media: atomisp: validate user-supplied buffer sizes in two ioctl paths
Date: Fri, 26 Jun 2026 18:40:40 +0200
Message-ID: <cover.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two ioctls in the AtomISP staging driver size a kernel buffer from one
user-supplied field but use a *different* user-supplied field as the
copy/store length, with no cross-check, allowing a kernel heap/ISP-memory
out-of-bounds write:

  1) atomisp_v4l2_framebuffer_to_css_frame(): frame allocated from
     width/height/format, but hmm_store() uses arg->fmt.sizeimage.
  2) atomisp_cp_dvs_6axis_config(): DVS 6-axis table allocated from the
     stream grid, but copy_from_compatible() uses the user width/height
     (both ISP2401 and ISP2400 paths).

Both add a bound check before the copy. Found by 0sec's autonomous
vulnerability analysis (https://0sec.ai); identified by static analysis,
not yet runtime-reproduced (Intel Atom ISP hardware required).


Doruk Tan Ozturk (2):
  media: atomisp: validate sizeimage against the allocated frame in
    framebuffer-to-CSS
  media: atomisp: bound DVS 6-axis table dimensions to the allocated
    config

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.43.0

