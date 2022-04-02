Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F510E9;
	Sat,  2 Apr 2022 08:51:03 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id p10-20020a056820044a00b00320d7d4af22so918997oou.4;
        Sat, 02 Apr 2022 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUOMhCxGGDDxH0dnq3ze5cK/Iq3zT9j9067V4Svj/w8=;
        b=hrLcCtLYrV4YeL/G377XYASUh4ynccAF3dZOX/TdMfZ0LT7DWHenqFFyLsgJ+xcmWY
         l30NBxyr80GQFqz2/yVqvr1QHMERlogfqRKw6AxdrAOikr9iths9SSGjgA6uZpq8IMXG
         +8hEFoqw969OmbP089du3ZZ6uDbQiiOAwEdtW5wH21gwR162yn+8axiyenkjardWQWEK
         oST7dqdh5VWZlBFhlphAzewFXgGGslRtGwBqwLtVOo+u2ccMieDYdKxUHVQd8EcjSsq5
         vqoFpNvvTlti4wUkJ/HqKUcglFP1uLPiuidpO6h1EVORreAvpbuuWdC0QlwvzTJw8ZRB
         o4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VUOMhCxGGDDxH0dnq3ze5cK/Iq3zT9j9067V4Svj/w8=;
        b=QzYWUu6EgBiw287cLzhKr/T9kINSawUb8zExvr2OvJ9/5AXjiHa5LFDfYavQJ/3xce
         /wDBQtZ1GhvvNe1v4AjN6+wO9hmL3itLm++Dq3C6UcLGGaa5bBGOvdpQQSgxosPd6xR8
         Cch/NgWoADc6pPqIa1MmpLzRA5mT/qTGZtRJZna8yL07UJErBKeDfBhS/NeG09mn9Rho
         CjoCwV3k7jcz2e6xg8guHjxS9L/Rc8fJpslz3+aCwI9sHNtmscrwp73j0AYK4k9wWlHY
         RHUaQHmS/kSe8sYC/oCJnZn510uC/eEkL8yYED4ljdFMVOnS0MOLBEHip3y+FtlhfbP2
         Dhzw==
X-Gm-Message-State: AOAM530/Q4cLows+Jr252ghXhjjq3PVdVKxzGfdGbFU9AMjQqCM5vFBK
	xp044z6BqdKoxM2/eKMR9Pk=
X-Google-Smtp-Source: ABdhPJxrzV+xUQGXp8PKXfzymFhsePke7giMv8WhRPhF+uAjb81XNa8NFgNWfLbe2Tkz9gZNql63bw==
X-Received: by 2002:a4a:5510:0:b0:328:faf7:9ed9 with SMTP id e16-20020a4a5510000000b00328faf79ed9mr3063895oob.65.1648889462911;
        Sat, 02 Apr 2022 01:51:02 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id o17-20020a9d5c11000000b005b2611a13edsm2146162otk.61.2022.04.02.01.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:02 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: cleanup
Date: Sat,  2 Apr 2022 03:50:42 -0500
Message-Id: <cover.1648888461.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch.

Rebecca Mckeever (6):
  staging: r8188eu: place constants on the right side of tests
  staging: r8188eu: remove else after return
  staging: r8188eu: correct misspelling in comment "conider" ->
    "consider"
  staging: r8188eu: format block comments
  staging: r8188eu: remove unnecessary braces in conditional statements
  staging: r8188eu: remove spaces before tabs

 drivers/staging/r8188eu/core/rtw_cmd.c | 70 +++++++++++++-------------
 1 file changed, 34 insertions(+), 36 deletions(-)

-- 
2.32.0

