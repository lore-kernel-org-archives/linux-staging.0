Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936D83FC6
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 07:41:24 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id s3so8667516edd.11
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 00:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asCsHBtUbI5ITQ2xcMkZ8DHrsYdlb3KLHjr5prFwuQs=;
        b=b8lKB1PFbvuV97/LRgUp0QUqLno35Zzu6Xg/4/pSl3ypPMVxbOwHNBRNfKW5TGLiIY
         t6KwJbe/zwgRfceo0zUAzx9l52XVQF0mFrGZMHSBlRI3OgY7fadn5BYINgmHIuUBxq+n
         Bhbsj6LnILijv2RVX4f5tSp2g8mUYTZMskK0yqq0F5rJTzFNbodRquxTUdZOsd1hv6V8
         VJIRFxn3kB8sVnnN/yMHqjeVi762dMjkZuLCYuIjvZGOvjgq2o91fZ5OWbhi5M7DRTRh
         laVYJ2Nt9MdBfAwCiaMSQmCvMrS3+SkTnhDCoFLvYvXQ8ifvRha+KU25BmdFmtQPOBmy
         y4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asCsHBtUbI5ITQ2xcMkZ8DHrsYdlb3KLHjr5prFwuQs=;
        b=fb5WB6haEnQcTX7VMvXQFFNqWJfnYYnMbFHztF159NEQTKN57m0wsBAXtul/g993wz
         ON+xh+at037xsx39A03vHv+shLOCej/ouOa3v8UOwOFnIkchvkOuHMCzCVha3lh8K1W5
         GZIscr5YTDV0PPRL+tsO7yoZJGkCWUFvgumEaWhW5DNW2XiYPtckb45zdRl8nduQs+/y
         3bANcNJ/tGZg5fnkjxgNTDZP3NRjM5dc0ISifAY2kJieOEkRScmtC27LDJciFK4EDld1
         1aO0HEB5c8BPfoEZulAibyfz0jNRvNqfrnQ3pHl0kLcYdc4G5J3jo28/yidMTtgdQxPX
         BpIQ==
X-Gm-Message-State: AOAM531Esh1QhmpG+GpOpdtDysO8ARtwzvUP6CyNkv5tYMe6Z9YFpXl0
	xWwOghjF8lMMpjXciUTQoKg=
X-Google-Smtp-Source: ABdhPJwwZ9pCKbIjUPo/obWVRUQPRrUl6BiSxE9dfgTSpEhCjmHly8uy45hhvGl+hQWHHcL+9SbbXA==
X-Received: by 2002:aa7:c745:: with SMTP id c5mr5491617eds.297.1629618082942;
        Sun, 22 Aug 2021 00:41:22 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id u2sm5364012ejc.61.2021.08.22.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 00:41:22 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, Michael Straube <straube.linux@gmail.com>, Martin Kaiser <martin@kaiser.cx>
Subject: TODO list for staging/r8188eu
Date: Sun, 22 Aug 2021 09:41:20 +0200
Message-ID: <1897566.d8lQ4HMSh1@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dear Larry, Philip,

From what I understand how the development process works, drivers in staging 
should have a to-do list in the TODO file. Please read https://www.kernel.org/
doc/html/latest/process/2.Process.html?highlight=todo#staging-trees.

Could you (as the maintainers of the r8188eu driver) please compile and 
provide the above mentioned list?

Thanks,

Fabio



