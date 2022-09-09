Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE7808
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 12:18:34 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id s11so2187159edd.13
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GzTst0nKwjS2DHPs7FOf2wavqhpxfB2fVlaUjY3LQyY=;
        b=a+7dyxcUXK7LyUVvaDRNrzzKcZwzbHlBiutzxuQOEPGBBS1QJZ0Yd6OfBEbWuJQWdc
         VIHzsS+m06PfHov7A0ghU7eoyExOSfq7qYyGiKj2I1uxBpuoP1eDWgY77U0jBI8qKk4/
         OkwJuRd0BS0H/MfZHH2m21yIk2tUSPYQYcMN+NZxgVGP0+C1z1Qzpw8LyYEAWJwnxRmP
         fpAbkx+m2cgCnN+4hw26oUpii2IjF0PUtPMR1wOBJpW1ekoCsEyvCNqcZtlLMqYbGAzY
         GBOdJltIy6TUEsfvWj5XiW68XHz3RMz//G2hIGFdL8EKT+6sbOcscWX+2iNadhkekl60
         dh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GzTst0nKwjS2DHPs7FOf2wavqhpxfB2fVlaUjY3LQyY=;
        b=A9mccHwfx36JC84vJVEQn1e+I/ytTa1mq0PFUgyNq1RRWQ+PsP2OIJcOvUlH7s28MF
         G/abuFxumyfdsNyjXjvZeMxq4k5YUfSzk9Cxrs8IGkWeJCIUgtzeGzZz4TAgND/8emQz
         QZKs6uoGxlkPSf4j0aGrIawAlhcfn4V3C9+7k/e1y4IlZiFcxwGU67UV+L8OfcTSOsf6
         /PjnHu3opOd9S9laRTqKsNgoL1jY9XAz47IqhEpvUy/2EJxErmOj5ilXA1ONsRPnGnnQ
         E3T5d+BxWSSCO60qa54zprmRArrKT97RHn2/VeWsbkC+QeDDWrRxyT0eeQfb/tH+Wm2M
         cq+g==
X-Gm-Message-State: ACgBeo2e+xtxxS2cFYHP5aTMUBMolJMm02vltcIP8mQG93W8diwRJWRl
	yeTKFV/9CYIgMxk5zD7xEiU=
X-Google-Smtp-Source: AA6agR5uBhRVTSQlVR+njblpjFjiUsBgO9vW3S/tHNvltk8Ma8f4HoLTfNSHDRoi/biM3dgxzkKe0w==
X-Received: by 2002:aa7:d447:0:b0:44e:ebb8:b691 with SMTP id q7-20020aa7d447000000b0044eebb8b691mr11011082edr.428.1662725913118;
        Fri, 09 Sep 2022 05:18:33 -0700 (PDT)
Received: from localhost.localdomain (wlan-244090.nbw.tue.nl. [131.155.244.90])
        by smtp.gmail.com with ESMTPSA id p17-20020a170906785100b0073bdb2f6f28sm167143ejm.217.2022.09.09.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:18:32 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/2] use memset to make code clearer
Date: Fri,  9 Sep 2022 14:17:54 +0200
Message-Id: <cover.1662724786.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-write some code using memset to make it more obvious. Also remove an
unnecessary volatile qualifier, because compiler complains about passing
volatile pointer to memset.

V3: get rid of "volatile" entirely, instead of just casting it away.
V2: re-write commit message because previous message describes a
non-existent problem.

Nam Cao (2):
  staging: vt6655: remove unnecessary volatile qualifier
  staging: vt6655: use memset to make code clearer

 drivers/staging/vt6655/desc.h        | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

