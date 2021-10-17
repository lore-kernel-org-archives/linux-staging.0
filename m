Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA4E2C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:11:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y12so61369304eda.4
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KFCZcjfiwZ8em2bIUvohm03NYCpTEjorljOS0YSyBrY=;
        b=jyL+eQd1lDG5gD4XlP4OaD12opfHM0/RsKh49LhSGymnyGvYmVc3aog7skDbwDMQ1k
         d9Q6mJtHDKPo6RS3CrnPtE5yTpy+n5yoNWjC+tKaKd7BBREgYiqqf4WAfOhfGa+tgaf1
         Ncmiq1nqZb7rN32XwAwQuIuZbBhfe4TIoI2zumppHmYvyuMVIm2oIyn2g9eHJGe/xJBo
         MQH3jdIv/9y7oF5gLSX3yN40/fr29lR7atjxc6er9AYY3/fiQstlpcD7JrZDLaLdnGSC
         srUlMpXMemnWZmCN4ySrPEKreMxAq7wpCXPdE4sC327BKczBI+JQTFHZjWy3GsE9eDSv
         oPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KFCZcjfiwZ8em2bIUvohm03NYCpTEjorljOS0YSyBrY=;
        b=xzdPHeqeqQ0OOgCA5SMy0218kfeB/DsSvZs5FoONvwQJ9oiriCVuF6sC4WWE8Ql5GD
         PiQmJIDbQcEpyRIBC9LI45q1JcS921j4ibaTqw6ziBsBWN/cO0T9QYtfxSkO8+pnCyCV
         LDG3ebtY6W8pz/0VWtXSL8odT4CtLp+opfxTo+OvRl96JpWtX82+g8yZ3mOevP/t9tb3
         dVYc83tEcmJ3Irq/iNPjQTWlEEOZIDGqOzhYVoCvruLff7TvtxqBqjOtDn8eyDkTbYsu
         C6stGhqggq1qchoZYaWrZ+IF9NioN7nJbIXrJD6sJSWh0a6m8NuNA1CkHkeh6kJfLe/p
         jfLg==
X-Gm-Message-State: AOAM5308Z1bv5fidex23/oorSwMIt1vJTgTzvbL20NSE00pqZhjjarWL
	uUZt6Gz/I6hDT8JIZN82WAw=
X-Google-Smtp-Source: ABdhPJyHNZPrGHC30R/aqnz+L0gTWqrzvLrTbxGZUrLAyZRwf+G70fgxJ1IXej/lgcvXNUoIsnA0MQ==
X-Received: by 2002:a05:6402:1914:: with SMTP id e20mr36321575edz.304.1634479896562;
        Sun, 17 Oct 2021 07:11:36 -0700 (PDT)
Received: from localhost.localdomain (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id u2sm8109222eda.32.2021.10.17.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:11:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>, Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] staging: r8188eu: don't accept SIGTERM for cmd thread
Date: Sun, 17 Oct 2021 16:11:14 +0200
Message-ID: <2278807.iFymIpo3Sk@localhost.localdomain>
In-Reply-To: <14217682.9BgDuDnfkJ@localhost.localdomain>
References: <20211016181343.3686-1-martin@kaiser.cx> <YWv67ozbJGxMa69t@equinox> <14217682.9BgDuDnfkJ@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday, October 17, 2021 3:14:49 PM CEST Fabio M. De Francesco wrote:
> On Sunday, October 17, 2021 12:29:02 PM CEST Phillip Potter wrote:

Please disregard this email. It's a duplicate due to some weird crashes of 
KMail.

Fabio

> @Phil, Correct.
> @Martin, Please correct me if I'm missing something in what follows...



