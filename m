Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A612F32;
	Thu, 23 Mar 2023 12:41:51 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w9so85994745edc.3;
        Thu, 23 Mar 2023 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVG2u0PxjcHnMZyDP5cFJRBQ+0w73Zdls1zxTkcKhxE=;
        b=l3b1/M2Cn2SD61AbMUAh/TBwjjFbzcvydms1Cs14uahXwTgTcqnU0eN+PlYSNNct87
         ZsAbO0RVQhGJoSm8skL4YDslmEpoWEiQQjDaUhpccrGwlnMMqmP/ro6TTynL8D+rwupr
         UIOU0nT3PJOD1ICiEoO5iKc6JgWeCu8XqAR7OC3gQCNyNXdkwKNXvmTpIu4zUY8gijRt
         upRtubyIV+CGhLZvzv99c3CXUVyoSjDR1o7U4GfxgFyFy7WLp8Pt5FHqItgOgQYjcICu
         6dvdEMsdqCfNYksFSukzPbusrBR/W8mGj62rPQrQcC5Oo9YNnwafeT3H+HrBC+bLjIrS
         Hstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVG2u0PxjcHnMZyDP5cFJRBQ+0w73Zdls1zxTkcKhxE=;
        b=nNbPdn/iG0l6t2KefeFjgwsBwVm26XRcbsl8ArvVKtLWkzY4IfzqEkkWN8eg2ETwPh
         UxA6BWyfo8x827a4nrTNGhfUaq4zsfWTVQNHCEfxX4hZbopQu29QOSm8qAu9s5JCf2Pz
         D1kPnFsO7nxoh12hM1/twz5OHMQMVnJ6TQhxhM61Itxc+efw9ZJmoL914bIOmx9FMRP3
         r7ZUX6HQ5CtHQNBQ7fYuAjoBiBQUttuO+5XzgGwjZrEfxZ5Yp2qw53y/9XIMMSQ8EKCf
         yb0Ia9i50d4tHEGi2kITLGVPZPFGZtvxzxrwzLw0Qwi8t7QvHVWXbYrfGn4sS7Tt40RH
         6wyw==
X-Gm-Message-State: AO0yUKVhE+Utk2UXoRBia5TOn+JvEomWv3Ijeg3XgAEEDbaVZdDkWhe2
	3ZbGQigF/cMkPLpacQ2abxvnV1HGC1eqP6WK
X-Google-Smtp-Source: AK7set/s2gwiKYde2VbiZIdsbRdcq5OBQtmxNrG1px1Vx8f93IvxUqwfvBJe2xjX2loauCDmeXu5Dg==
X-Received: by 2002:a17:906:960f:b0:92f:e4c5:5a28 with SMTP id s15-20020a170906960f00b0092fe4c55a28mr10840307ejx.54.1679575309342;
        Thu, 23 Mar 2023 05:41:49 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b0092669fb4ba1sm8597116ejh.130.2023.03.23.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:41:49 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 0/4] staging: rtl8192e: code cleanup patches
Date: Thu, 23 Mar 2023 17:41:41 +0500
Message-Id: <cover.1679573474.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several cleanup issues reported by checkpatch.pl in module
staging/rtl8192e in file rtllib_rx.c

Khadija Kamran (4):
  staging: rtl8192e: remove extra blank lines
  staging: rtl8192e: add blank lines after declarations
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove blank lines after '{'

 drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
 1 file changed, 29 insertions(+), 44 deletions(-)

--
2.34.1

