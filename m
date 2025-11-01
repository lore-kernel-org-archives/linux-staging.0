Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2F2F6924
	for <linux-staging@lists.linux.dev>; Sat,  1 Nov 2025 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762000878; cv=none; b=H6PLa9G8KMET7xEYH/ZCMeiDDGW3mNNTDgUgFkaU+adu8JCvyt37Da1rGTMN0EiB8Y+ePftwd0QsPmNJiqmZp++iSN3Rx+rNr4NyxXjoA4dSA+S9f1dA7rSdMSE39XGyBjNRt/SSy79Qgd0WUIXfARIWH2uKNzX+9DoUKeIEJhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762000878; c=relaxed/simple;
	bh=l2ALCl5HbcXAMygzBlHdv1lbiqEHFDZclmJcdlt7iEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hlsi4wJC4AQ1sK8OQrXPHlt/SwEkTJ4eAuYrYLNasOt4BK7jFQa1URB3Zg3Wg01QAoXNwP7KhTU9glRrvQq3m+LBh4mjCU85X6Gz9WiRiu0pAybSK7WckUR5RgX/4O73TjX7tzfTIeMrFT5AVmfmdQ5emkTdROazWWhbPMKr4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpslXph1; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpslXph1"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8909f01bd00so352473285a.0
        for <linux-staging@lists.linux.dev>; Sat, 01 Nov 2025 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762000874; x=1762605674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZlRqECWPUQ+ycgjsFtxLP/p6UN8xzpR7CbKhtt9Z3E=;
        b=PpslXph1eWVSS82FEImsPSTcTrE3ljqV6l6ghXk2ypdfh4n887ghl2rrll9FEAFNuv
         u5oWcpxtit1s0tMsqbSHtLtnCMgOcR86u8JcgCnWmqwo2borAG8sq1K08VpMwv2LN7jK
         NnsAtXn9YNGXra6AFbnWGQwUN0eSndKluZmUN0Xr9LgUJkwubwZyztoIp377hf2XfcEA
         8IieiLBfZy9xLTdZBGLq5X0s3vo7IGi795YsGI6OYfwX4ToTCAIQ8VGd5enDJ82ns8ps
         cC9HRAMR05lzxIU+Xm7YpX0Hk6crGgbNN5fNuLQmkQ9HINQtBdFBN9cCFHygkG+VcXoF
         yp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762000874; x=1762605674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZlRqECWPUQ+ycgjsFtxLP/p6UN8xzpR7CbKhtt9Z3E=;
        b=uNzFsMjUl5+BItNakzJTxff7PmKGZ+t79nxRe88V1leWXoLIRplLnEb6xGz2QUjdTd
         DHrbVbl5qFNxiG+zKTazJJH9shG6gxlrPjWIlWbyej1W6RYHn2SQOu+mHZYHA80YMcpk
         Orvn05PaRXIQQbFuvMSiGf19G3ssKX9BctM70RF6jriEYNq63mXVSp8ymOQnv5VXeF4r
         ZaclkEnuFZanUnAEvGgcBwMj96XxS/MrxYghZGoxs77LDKSU51Kj4KZcBEzkkk2Tqsw1
         N3bHb9XRgzR+F5VAP0EJrNnuZn4CVIMbl250FRGjRMvrCPKDvdL3VMuGrYPX4f3pp62W
         ehQw==
X-Forwarded-Encrypted: i=1; AJvYcCUmLKHfcYnpxBNs/uqbtDk69g5ym4OpYlJqThzDYthH+LXOa+t9513lQ7y4kcuoc7qj+O2ud+3UU2OqMfza@lists.linux.dev
X-Gm-Message-State: AOJu0YzXC7eqARbJzMXuYJmklgg0SCctx7ynISMw+t0t/yVBUOh8n/s3
	nN4QVuz+HKk1vCNy2a0Jc4Ed1ut6iwKpdpOCrKy4aPmPBFSg8oj0Bj0H
X-Gm-Gg: ASbGncvzbpaFB3KRtUp64tHVN0/TQXXvS/ul6RIHsxTzeakCgGmAJFpZefXjcGnJlLt
	I6pxU4mVSnhMFBE2UoDdtrNOVTptCphxS3e0wJ0ueylE2gk0B3zaQ7HvZXvvURy3dm6/LriRPoc
	hPoERV/5VPUK4KiZy0Mz969js/HKjhDVL2Ua6Zu+AG+a1ow1PFyfS1bBQTdTUmuuttCvFef06Ah
	7jPxwZKEx9oe64SId60OU6pFV1D+uw25ONrTQ5RAtkRpDHeoor8DA3gPS8FckgQO6hJokxpDBf2
	ZQTSSrBINSEc8geXAy2jDPaj9G5zzXWP2nqHfJmiBZasYv2dQ39kZs23eoFEDoC9O5lT299xu2B
	7NLAp1Cjzl4BeeTF7AckJqFtvPFUTZEotkh56Ti29VOBP5sgOLp4Uk9UZ1cJmzPk15PRGDKctuZ
	mZFQ0HbRwob58=
X-Google-Smtp-Source: AGHT+IGj3U/g/cPjEItiqMdhy6grP3Lk5LuQk5kV9elcuxS/9ldBo9mq1RPOnbUWcoCczmmSDPe2TA==
X-Received: by 2002:a05:620a:458e:b0:866:f322:c6c0 with SMTP id af79cd13be357-8ab9b4a3f77mr882249385a.60.1762000873501;
        Sat, 01 Nov 2025 05:41:13 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ac02f85391sm291235585a.29.2025.11.01.05.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 05:41:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 996204209E50; Sat, 01 Nov 2025 19:41:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Staging Drivers <linux-staging@lists.linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] staging: Pull in staging drivers docs into documentation tree
Date: Sat,  1 Nov 2025 19:40:53 +0700
Message-ID: <20251101124053.62544-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7662; i=bagasdotme@gmail.com; h=from:subject; bh=l2ALCl5HbcXAMygzBlHdv1lbiqEHFDZclmJcdlt7iEA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms/+We3S9T4FT6W2uqaXek4fMV/pkzvgn3TUwqPq39+ uis9TLnOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRqIeMDMeD7Bx2bPHbOFOG PUwi/8Pxd1F37j+/b/Zr0XHX2tgG9R5Ghv4aH/3rxtVrn9lXV046YGi6cGGg0ae4VylaGed+NO+ cxwMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Some staging drivers have documentation that are spread out in
drivers/staging/*/Documentation/. Pull them into kernel docs tree by
using the same technique as in 1e9ddbb2cd346e ("docs: Pull LKMM
documentation into dev-tools book"): wrapping them with kernel-include::
directive as literal include.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../staging-drivers/atomisp-notes.rst         | 10 ++++++++++
 .../staging-drivers/greybus-firmware.rst      | 12 ++++++++++++
 Documentation/staging-drivers/iio/index.rst   | 15 +++++++++++++++
 .../staging-drivers/iio/inkernel.rst          | 12 ++++++++++++
 Documentation/staging-drivers/iio/sysfs.rst   | 19 +++++++++++++++++++
 Documentation/staging-drivers/index.rst       | 13 +++++++++++++
 Documentation/staging-drivers/most/abi.rst    | 12 ++++++++++++
 .../staging-drivers/most/driver_usage.rst     | 12 ++++++++++++
 Documentation/staging-drivers/most/index.rst  | 10 ++++++++++
 Documentation/subsystem-apis.rst              |  1 +
 MAINTAINERS                                   |  1 +
 11 files changed, 117 insertions(+)
 create mode 100644 Documentation/staging-drivers/atomisp-notes.rst
 create mode 100644 Documentation/staging-drivers/greybus-firmware.rst
 create mode 100644 Documentation/staging-drivers/iio/index.rst
 create mode 100644 Documentation/staging-drivers/iio/inkernel.rst
 create mode 100644 Documentation/staging-drivers/iio/sysfs.rst
 create mode 100644 Documentation/staging-drivers/index.rst
 create mode 100644 Documentation/staging-drivers/most/abi.rst
 create mode 100644 Documentation/staging-drivers/most/driver_usage.rst
 create mode 100644 Documentation/staging-drivers/most/index.rst

diff --git a/Documentation/staging-drivers/atomisp-notes.rst b/Documentation/staging-drivers/atomisp-notes.rst
new file mode 100644
index 00000000000000..72ebb8970a067d
--- /dev/null
+++ b/Documentation/staging-drivers/atomisp-notes.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================================
+Notes on working with atomisp drivers
+=====================================
+
+Literal include of ``drivers/staging/media/atomisp/notes.txt``.
+
+.. kernel-include:: drivers/staging/media/atomisp/notes.txt
+   :literal:
diff --git a/Documentation/staging-drivers/greybus-firmware.rst b/Documentation/staging-drivers/greybus-firmware.rst
new file mode 100644
index 00000000000000..8e70942366f772
--- /dev/null
+++ b/Documentation/staging-drivers/greybus-firmware.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+Greybus firmware management
+===========================
+
+Literal include of ``drivers/staging/greybus/Documentation/firmware/firmware-management``.
+
+----
+
+.. kernel-include:: drivers/staging/greybus/Documentation/firmware/firmware-management
+   :literal:
diff --git a/Documentation/staging-drivers/iio/index.rst b/Documentation/staging-drivers/iio/index.rst
new file mode 100644
index 00000000000000..a6fccb8c8673d7
--- /dev/null
+++ b/Documentation/staging-drivers/iio/index.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+Industrial I/O in Staging
+=========================
+
+.. note::
+
+   Refer to Documentation/iio/index.rst for IIO subsystem documentation in
+   the kernel proper.
+
+.. toctree::
+
+   inkernel
+   sysfs
diff --git a/Documentation/staging-drivers/iio/inkernel.rst b/Documentation/staging-drivers/iio/inkernel.rst
new file mode 100644
index 00000000000000..0b7457bc4e4ad6
--- /dev/null
+++ b/Documentation/staging-drivers/iio/inkernel.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Industrial I/O Subsystem in kernel consumers
+============================================
+
+Literal include of ``drivers/staging/iio/Documentation/inkernel.txt``.
+
+----
+
+.. kernel-include:: drivers/staging/iio/Documentation/inkernel.txt
+   :literal:
diff --git a/Documentation/staging-drivers/iio/sysfs.rst b/Documentation/staging-drivers/iio/sysfs.rst
new file mode 100644
index 00000000000000..9a069f1c5e669a
--- /dev/null
+++ b/Documentation/staging-drivers/iio/sysfs.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifer: GPL-2.0
+
+===============
+IIO ABI symbols
+===============
+
+Literal include of ``drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a``.
+
+----
+
+.. kernel-include:: drivers/staging/iio/Documentation/sysfs-bus-iio-adc-ad7280a
+   :literal:
+
+----
+
+Literal include of ``drivers/staging/iio/Documentation/sysfs-bus-iio-dds``.
+
+.. kernel-include:: drivers/staging/iio/Documentation/sysfs-bus-iio-dds
+   :literal:
diff --git a/Documentation/staging-drivers/index.rst b/Documentation/staging-drivers/index.rst
new file mode 100644
index 00000000000000..7dfcf4ba32ec13
--- /dev/null
+++ b/Documentation/staging-drivers/index.rst
@@ -0,0 +1,13 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+Staging Drivers Documentation
+=============================
+
+.. toctree::
+   :maxdepth: 2
+
+   greybus-firmware
+   iio/index
+   atomisp-notes
+   most/index
diff --git a/Documentation/staging-drivers/most/abi.rst b/Documentation/staging-drivers/most/abi.rst
new file mode 100644
index 00000000000000..13f14bcd9a1b7d
--- /dev/null
+++ b/Documentation/staging-drivers/most/abi.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+MOST ABI Symbols
+================
+
+Literal include of ``drivers/staging/most/Documentation/ABI/sysfs-class-most.txt``.
+
+----
+
+.. kernel-include:: drivers/staging/most/Documentation/ABI/sysfs-class-most.txt
+   :literal:
diff --git a/Documentation/staging-drivers/most/driver_usage.rst b/Documentation/staging-drivers/most/driver_usage.rst
new file mode 100644
index 00000000000000..c22534b0e280a2
--- /dev/null
+++ b/Documentation/staging-drivers/most/driver_usage.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================
+MOST Driver Usage
+=================
+
+Literal include of ``drivers/staging/most/Documentation/driver_usage.txt``.
+
+----
+
+.. kernel-include:: drivers/staging/most/Documentation/driver_usage.txt
+   :literal:
diff --git a/Documentation/staging-drivers/most/index.rst b/Documentation/staging-drivers/most/index.rst
new file mode 100644
index 00000000000000..29ffb1e6c06166
--- /dev/null
+++ b/Documentation/staging-drivers/most/index.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+Media Oriented Systems Transport (MOST)
+=======================================
+
+.. toctree::
+
+   driver_usage
+   abi
diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index ff4fe8c936c8ba..08fbf043f9f7e1 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -91,3 +91,4 @@ Other subsystems
    peci/index
    wmi/index
    tee/index
+   staging-drivers/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b82..04dd4dd9ed9d22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24440,6 +24440,7 @@ L:	linux-staging@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	drivers/staging/
+F:	Documentation/staging-drivers/
 
 STANDALONE CACHE CONTROLLER DRIVERS
 M:	Conor Dooley <conor@kernel.org>

base-commit: d68eb9096fb065cc0cb5218ae651f54b08de5831
-- 
An old man doll... just what I always wanted! - Clara

