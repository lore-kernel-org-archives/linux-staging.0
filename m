Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C2D539B;
	Thu, 30 Mar 2023 14:11:32 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i9so19247583wrp.3;
        Thu, 30 Mar 2023 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suzBhYGEckJpiDnidEm8UQbSBjCPRce9GnZilv1Z3Sk=;
        b=CDHvrnewhzU2bDj2QxJ/1JEUE1icAzUTwPeXhc99jWN3pDvmcBH3G7v/mVLl2BGIi4
         Py3Cdi9JQE5UPkM6UB7yE8eYKOwfWLLmF0sbkaYbY5XOi95XDHYnM1Yg5Gz6bQXHAqDN
         Z4H4cYw6yItdRsHQ4vzZ4b5HGU7vjU9Kl7nrhOFuycWr10H6p2cDpLyOlRJLMhVSGWvD
         9ctZSg06op0wrCBvJyYmUxnUPxrVY6OS3iQ1Ocsu1oWvCM4vf2KZUVlIPxZ0PDd0hukY
         3c2jHh+SfgIG3eYcUxMHzmHwtW41FigkG9mU5lUWCAt4SCCBDtES7uQz/1XrUdFTNy2d
         R6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suzBhYGEckJpiDnidEm8UQbSBjCPRce9GnZilv1Z3Sk=;
        b=GIDvgAPYT5P/VsUi+QLTngh+Avt8BaRyLnyBpQN3VCWm9rrE4VHZvJJ6y1IEnsiB5V
         Dbv5ZXrT2PsX5m/61IaWnbToyowHqwBbasn4Nf6/RTDfwnz3HN/jPG3/u27qJG2SUB11
         qTUeeX0+FOaLvJcoQ5sMjja7Jgg8GMyyTtYqVrhDb/je5tbIcoa4hlomEpLH5b/2WtEj
         jPpMdHdNQ6NTZGtKeFs/qS71o6KVxHaH6XswB0TNryeFSsfqBsVhNUSTwaC+8FaWx/J+
         rDMh0aPgaZMfBhT+Vp72zRDGLX6HMm/0J9Qlzvjwceh9zpUMTWFJYLzKDzDqUP/GMh/+
         KDHg==
X-Gm-Message-State: AAQBX9eFwCnkntwpt3hgjkPOlAnRr3+HxOzGf9OsR2EUS7+Ku2slU80f
	CuK7/At/kIQlhxx5tTZ8b1Aj4taba2aVomcK
X-Google-Smtp-Source: AKy350bro9ZzpIVJRHW9Gvn4LewJPSesVpqGyWOYSPIH7E/0ujl20zY5nVejXjg/5v17iKNiuhUA6g==
X-Received: by 2002:a5d:63d1:0:b0:2d5:b6a9:772a with SMTP id c17-20020a5d63d1000000b002d5b6a9772amr18420910wrw.17.1680185489816;
        Thu, 30 Mar 2023 07:11:29 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:29 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] improve arche_platform_wd_irq() function
Date: Thu, 30 Mar 2023 19:11:23 +0500
Message-Id: <cover.1680185025.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve arche_platform_wd_irq() function to minimize indentation and fix
checkpatch issues.

Khadija Kamran (2):
  staging: greybus: add a single exit path to arche_platform_wd_irq()
  staging: greybus: refactor arche_platform_wd_irq()

 drivers/staging/greybus/arche-platform.c | 84 ++++++++++++------------
 1 file changed, 43 insertions(+), 41 deletions(-)

-- 
2.34.1

