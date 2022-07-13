Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A17A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 07:58:00 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id fz10so10929223pjb.2
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=itk4b7NI3cUu3jWtxKH1xulHC15KgYDHmxRNmYEuEag=;
        b=cQqpDFouGoelXK+51mWiEyy4aEqiZ1PTeTmzjbIJXULZsc55Hbhisz/JLHfIreC8JU
         FlMILCQc2lWfedW7qPP+6KWG7af3vv0zWWGIKRUqeaVAhV5ZrPZCfQIQTfCoTxDxDXUo
         xyKrWQ/YoLnC1oEHX7AZmG6ZE9gEt2oX5M+aQebEF6tDkh+t+6XmViv8Fz4D+jhHVdm9
         Lna+PV31ZyBTXYOrXzvNfaZh/vmKhFYwn9/z6Emtarf0AQJ0Tx/cmEPeN7/Qq+ymVWXR
         BsfWhhogTaw4SkoBLkHTHiWmGUlOtz9I3gkHlzR+n3tRgrPERBkBCW42d830u46bfZYl
         nZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=itk4b7NI3cUu3jWtxKH1xulHC15KgYDHmxRNmYEuEag=;
        b=Z6WVCVERhbGXIs5ybp3emOIHgnuHlJ/iKY3r3ip0qQ6as78t3XFpsVAGWjt4N/bBVM
         eJagOxE07xyIZnV97W5bs1C+0F6kj3InD4Rno8eASGPSoN3/qkAxVYXl+Ho+CTgfhMKw
         Uh5aAgE5Z268NXo6AXE+03lyV4OQgNFDMVHpCgF1+qX7TUVKqHWGIZZW7or8S0fy9Xu6
         twKsYIXSPWxHQyNproiFVlKG5SIJL9YnFPzu1gOHTK/K7moLuxgWXFreXOOIzIFEt5CE
         6ilTtnszXPGpX4I+SRuvGpMGDC5Ft2Z6v2UA3Bx8IIQ0owFO6qq2G+bLwcZbrL5kuR6L
         FDDA==
X-Gm-Message-State: AJIora+oLRXGccTOD7EAdkpbjiXf7RlJn8UKzkN3P5jHr//tG/lMjJaY
	yMZJv9wKHM+edP3ZyaUhR6Q=
X-Google-Smtp-Source: AGRyM1vEOmrtElVqUWrF6r6F+AV+U/B8Oom5YuRasbPruMxHLX3oh3h9bSstYS/cpgxpJ6B+HGc3cw==
X-Received: by 2002:a17:902:cecf:b0:16c:4a62:62ab with SMTP id d15-20020a170902cecf00b0016c4a6262abmr2005587plg.129.1657699080012;
        Wed, 13 Jul 2022 00:58:00 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:5ee1:7060:fe1d:88a2])
        by smtp.gmail.com with ESMTPSA id x16-20020aa79570000000b00528c0e516fesm8124882pfq.152.2022.07.13.00.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 00:57:59 -0700 (PDT)
Date: Wed, 13 Jul 2022 00:57:58 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] staging: qlge: code refinement around a for loop
Message-ID: <cover.1657697683.git.dantengknight@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

*	Patch 1: 
		Fix indentation according to checkpatch.
		Format the long for loop thanks to Joe's review.
*	Patch 2: 
		Optimize by avoiding the multiplication thanks to Joe's
		review.
		I agree with Joe and think it's the same logic, and it
		compiles without error.
		But I don't have the real hardware, so can't prove that
		code is still doing the same thing. So I understand if you
		don't apply this patch without the "proof".

v4:
	- Separate the code style change and "optimization" into 2 patches
v3:
	Thanks to Joe's review.
	- Align page_entries in the for loop to open parenthesis.
	- Optimize by avoiding the multiplication.
v2:
	- Change the long for loop into 3 lines

Binyi Han (2):
  staging: qlge: Fix indentation issue under long for loop
  staging: qlge: Avoid multiplication while keep the same logic

 drivers/staging/qlge/qlge_main.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.25.1

