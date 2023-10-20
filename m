Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487261A71B
	for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 23:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTKPCers"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c17de836fbso18608471fa.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697844222; x=1698449022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tA0wMNcNERqG1nwtTkGl0joUZs+Fa3lyRNyXvmPuo8A=;
        b=dTKPCersEelbgH1TNiE4wOtic++WzK/EB2Z75WBZEZfCsOvz0HKvRZ5pJZbQOX10E2
         whtIyw+90r3VxiAWbYMQxcGhljA+dV3yTISpHqQG3abkhBO5LFoEPddDkNVsp+NnpYEi
         CqXDfjh3WyXpgqoDfgnb2UMZXfrxifgB3VWmoP2Jpg1xE+B2431cdV3gs4HcNAfuZPDl
         VNMu9JIJriWYKCzPzQSBqvLeL4auNWFcJKAzUKYN3VHIrXp3Yzd9m786RPbO9/pTabrF
         XE1XqKYk0FccPwJbr8CdecrPeWQ+qa21pJxbw/IxgSvVrlQBJbfQX8izFwFOmwm6tOcQ
         beSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697844222; x=1698449022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA0wMNcNERqG1nwtTkGl0joUZs+Fa3lyRNyXvmPuo8A=;
        b=N9CYOiGbzpUkJnOoxekkeYX32zrjrW/Q1HWXWcZOclXBI6GRA810CxxJ4Qcze0MKKv
         AXL2cm3s47ZCZFRMB9lds9u/geDfhMd7KSumpsjlbor3F2DqQ7YRvvvpSfvMYrWqGNaU
         fprtLSSjOM0RAFSb/NhuEMdUKqID3Dr6oGKtL/vDh25Kv4s684q7iBqFBAYUEym995OQ
         FSwk/PUec3/T/LQ7Zq9zJA6F/8CXV7kEuztxBJQH20Lqy9PuIDEOQ2jsWHbh31LH8eS4
         OYjZVYtXi6b/1fMKLnO/H03FcjxN+Xn++w/nmGJR+JshZC3Ffoi4ACgBXXW76wa6kLcK
         cNXw==
X-Gm-Message-State: AOJu0YwyeQWxpUWg+A16AsQiABRtVk9jGVUsardtVu7QuvOqPfqunLci
	d3kBD76W7wxS4VCZk84npKo=
X-Google-Smtp-Source: AGHT+IHZGy4hFw7sOwzF8cc2MWGCxLuUe9zs/pEzRv+NcaT5SFOm5DEbigsLc9Xt1jfKjVkjcsGMEg==
X-Received: by 2002:a2e:964e:0:b0:2bf:ab17:d48b with SMTP id z14-20020a2e964e000000b002bfab17d48bmr2245279ljh.34.1697844222079;
        Fri, 20 Oct 2023 16:23:42 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id s5-20020a05651c048500b002ba586d27a2sm567571ljc.26.2023.10.20.16.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 16:23:41 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 0/5] staging: media: av7110: Fix various formatting and small code issues
Date: Sat, 21 Oct 2023 01:23:27 +0200
Message-Id: <20231020232332.55024-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches cover various formatting and small code issues. Formatting
issues include missing newlines, whitespace and miscellaneous formatting 
issues. The series also fixes small code issues including using preferred 
integer types ('long' instead of 'long int') and ('unsigned int' instead 
of 'unsigned').

Jonathan Bergh (5):
  staging: media: av7110: Fix missing newlines after declaration
    warnings
  staging: media: av7110: Fix various whitespace checkpatch errors
  staging: media: av7110: Remove unnecessary whitespace before quoted
    newlines
  staging: media: av7110: Fix 'long int' and 'unsigned' variable
    declarations
  staging: media: av7110: Fix various formating issues

 drivers/staging/media/av7110/av7110_av.c | 114 +++++++++++++----------
 1 file changed, 64 insertions(+), 50 deletions(-)

-- 
2.40.1

