Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E82F22;
	Sat,  1 Apr 2023 18:58:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso17403470wmb.0;
        Sat, 01 Apr 2023 11:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pvhkRPvXdeV1MvCkQhlmcgNllu5JzWC+z+MaeDHhAgk=;
        b=pP7DiipO3CsrF0nHke2LU6/tnLaYTX3qA+/kyd2for23PMMErAm7pbzbuwFCpqd5kb
         9+c6eHLeO07zPWaylJi29feeJjw3U6yfsGCIy8THKWpi4FIZPu+fLsQxU3E5Sywac0D+
         52vIlHkYi/Y+5b7FSIbL7lQuOPRXQmAnRJVAFoH2VeKPeFayLP2/g8H7czxyT4OJnRH4
         gPddsLd/WNGFK17fvN+OaTH2/jZeLLRRxTgjMYoZzGiZzUuJjOJeb6iTYCJBFjrGyzVz
         uJcguOzJrFEf9Hsf4l9f5N+wQMlXMjuIaijQKt1G9N+093WG1yXNjgTrwGsx1vKYDo4p
         UuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pvhkRPvXdeV1MvCkQhlmcgNllu5JzWC+z+MaeDHhAgk=;
        b=KWj3E2k5VEidixIpqmHYaHDIVkTjtPYD/yzL1lc4BYB7U27vfWU8rGCE4eix932naD
         WcEb1NvoHhqK7u7Zb5F0i3vZ7+NH6WKjcqAbkDlfo3s1VVapymZVJK52q35QlGhPiA8x
         rKzy6l5ltb+La7R43SDjlAh0jLo8rCDn6cadDfsg4RA52WUeLZuF4wPoMeTdunatQQRy
         cA7mfFaxvb1vySLVUGg6yZUxqzOWenYTubNFUsYPDkGlFvT4qZALjaOysKLYXqZZabT8
         jgLxRVyg45o9yzn0CWKsdWkOZDLxSEkTphpqqIhWw2uPi7X0Q9+vF/0gmjX2z7ABh3p+
         SuTg==
X-Gm-Message-State: AO0yUKXYUfbyWVOx1w1l9CKSIDKKcVxdbQiDfKZhFJpzlgS0t3h+56bM
	BPzxNMoSw2VW3gP2VFMY4solGTTu++siYaEb
X-Google-Smtp-Source: AK7set9oCYKWk9mo+0+bIIkFTcMGIXiDNA91s9KMCxQWQegj/+KREZFB2CNsQetfeOnslex9ai85gA==
X-Received: by 2002:a7b:cd97:0:b0:3ed:ce50:435a with SMTP id y23-20020a7bcd97000000b003edce50435amr23042468wmj.10.1680375528092;
        Sat, 01 Apr 2023 11:58:48 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s17-20020a05600c45d100b003ed51cdb94csm14017463wmo.26.2023.04.01.11.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:58:47 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8192e: fix checkpatch issues in rtllib_crypt_ccmp.c
Date: Sat,  1 Apr 2023 23:58:39 +0500
Message-Id: <cover.1680375200.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several issues reported by checkpatch in rtllib_crypt_ccmp.c file.

Khadija Kamran (5):
  staging: rtl8192e: remove extra blank lines in rtllib_crypt_ccmp.c
  staging: rtl8192e: fix alignment to match open parenthesis
  staging: rtl8192e: avoid camel-case <dot11RSNAStatsCCMPFormatErrors>
  staging: rtl8192e: avoid camel-case <dot11RSNAStatsCCMPReplays>
  staging: rtl8192e: avoid camel-case <dot11RSNAStatsCCMPDecryptErrors>

 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 33 +++++++-------------
 1 file changed, 12 insertions(+), 21 deletions(-)

-- 
2.34.1

