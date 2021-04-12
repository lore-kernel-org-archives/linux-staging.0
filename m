Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84272
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 17:59:09 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e7so16117250edu.10
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 10:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/wwcGG3rNXNsZQgkGk7QbLfEu6ULkdlrYbUXwHoD98=;
        b=kHnoF8nNrf8iq5HdVKMzM6b8YJRKVAxeWL8MlhUNzfwMdNjyfM7Y3PIDrGZCFh5n6V
         DZbSRNWF0jfw3Zoa9SsLWtYsTMI8m5/eP0usAF7P7Edv6LRPahDNLgTdVfZhPqg7DKOo
         adNPHS1OvMS5ShLem6OUVzK7BVf8soeRc6HXeekSJEbPTA0Mn82Huo92OyCaOuF9+kTM
         oHeqt0CUmj19qdQMvrqY8K8cA2kInXmE1nyZo8uPpcby9ebsLzgrGpxLuViHra7/MtSv
         dOgMVlomqvf14hrxLqYc9jJIQHx3MUcmQH7xU9X6xKdZILuAfNrD/4ya964yV+piI2YZ
         vZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H/wwcGG3rNXNsZQgkGk7QbLfEu6ULkdlrYbUXwHoD98=;
        b=Lso+ZseP00czs50hCQARxm2qiB9UYTysyhhCnLzxieK8IdOU81Ol1KpgslYZdWWsDs
         iE4ZSt/mD490IM0lhsm8Evl43F6xfElPBZJJoqbkpPdisYCLJGYSgS5HWusag+tXZqkR
         n55AHRv3a8/vq5Bz2C7nAI90bTrxl/n+w+4AuFsPp62T7bW9pCLQKbgbqfDlhNTVh3p/
         koA7MjwQ/YklRUfU/OHzRmDc3kzGwl8+xnYg1AFOI7LppA36n8tPmRzho0Fubgy7dJSw
         1GYwxDnR8+nFA0KgwOmjTBtIzxJMsQjbe6HhyK4n3goj0b5QvxNiZ9TCQ4a1GRnVCMBR
         8uBg==
X-Gm-Message-State: AOAM531C8uaDH+NXyFpz3GfYw2bwYLwDv/bsep1unvDgg6uHLe4zdiLM
	0jxJJHcjIJQ2IO3jrVpGFxg=
X-Google-Smtp-Source: ABdhPJxCJ9iMV8FrvfO4lMKc6BT20x0Fb6U0Bynd/YCdqCBulg8m2X3/kbdnTX84qd1TJezlVRYspQ==
X-Received: by 2002:a05:6402:2054:: with SMTP id bc20mr17256693edb.334.1618250348558;
        Mon, 12 Apr 2021 10:59:08 -0700 (PDT)
Received: from linux.local (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id gz20sm6300534ejc.25.2021.04.12.10.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:59:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 0/2] Remove spaces and blank lines  
Date: Mon, 12 Apr 2021 19:59:01 +0200
Message-Id: <20210412175903.17819-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed spaces before tabs and multiple blank lines from Hal8723BReg.h
for readability improvement. Issues detected by checkpatch.pl.

Fabio M. De Francesco (2):
  staging: rtl8723bs: hal Remove spaces before tabs
  staging: rtl8723bs: hal: Remove multiple blank lines

 drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 43 +++++++++------------
 1 file changed, 18 insertions(+), 25 deletions(-)

-- 
2.31.1

