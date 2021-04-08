Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1870
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 09:17:27 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id v8so698487plz.10
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 02:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=3mu2tgSjeO8kAVzp1TsCINDeAL4xZ2nSQTlFe4YLtTA=;
        b=Q2DOlAeE25xirlQIVu5MqdlYUXnkzzHice1uOMGrS2vhGvC+fBot5hS5rc7qHxpwhw
         4BcxuXLji6ORs+7mmgdaGq6aB7qPRJ6S4fjoPzPkf4jaOVAodJSwbCrYJfmmCmmhZ8qL
         H9j1jJpHogvqOW/c/Pll/LipELBeyBnf6kpzocrxo8lNe7zPYI40jwuiLdrdhfGtdJ8z
         2E6gSneC9Sxoo+9EoYBhlZnPlj1HeGGtT0MVuHYgx7IEV8WULa1XhCwTdPWGZ/JgrOqX
         0u0crnClnqHZaNx3VN5W4BhOtSmeAm40NoQRPFj0RZka+iaBIIeFrJqbwqYILGN8HItx
         gHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=3mu2tgSjeO8kAVzp1TsCINDeAL4xZ2nSQTlFe4YLtTA=;
        b=pReoY8cGVrOwamuVglcWIH0WcO6oJWiSVzJPX7yVfEK3TawB9EnPCRfQivc+7XtIMN
         fK/l0qCocSbSBkelP6ENvNPt7qTKUVycq4sn13hWE9bZ/jhaqJSugHkUNlN4tVt38bZx
         2kM+iUwn0WmncDUBzzD79sTj3Hty2JMN5jSQwOUxb3ous7pEF1pQ2Nxna96LFA3/wNMx
         BsPuMppVTMagA7FPVkG+NFgJM/X5biSSMYmwVbBwss+GiJADYWvxYUS9h2l+IaKSPFL1
         x//eoxkh3oNZjNHTYlfD4XTv33Rxmv1tNb3GsbXU0sfsgtvci56h228KYccBfWYneV/l
         /QPg==
X-Gm-Message-State: AOAM532Kxtm4hzkascPoR3hV9c8jrnRv1nEwvByQpoudNrq6iLNqu0bn
	NF/abPa+e1UYIp53Ohf9Uf0=
X-Google-Smtp-Source: ABdhPJz6EWrSHYrC3lLKoIkpxc7TxjVAqcqhnexSFarvAreG36tjZCUsesDGdy4iPUCVwyjHEIk0kw==
X-Received: by 2002:a17:90a:890f:: with SMTP id u15mr7369430pjn.25.1617873447113;
        Thu, 08 Apr 2021 02:17:27 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id 12sm23771545pgw.18.2021.04.08.02.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 02:17:26 -0700 (PDT)
Date: Thu, 8 Apr 2021 02:17:24 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: sm750fb: Question about dviInit from ddk750_dvi.(c|h)
Message-ID: <YG7KJDoolmQRhZsd@localhost.localdomain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I was working on some checkpatch fixes for ddk750_dvi.h and ddk750_dvi.c
when I noticed that dviInit function does not seem to be invoked in any
of the files that belong to this driver and can be removed. Am I missing something?

Thank you,
Pavle
