Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D1524F
	for <linux-staging@lists.linux.dev>; Fri, 24 Feb 2023 11:09:43 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id p8so13650353wrt.12
        for <linux-staging@lists.linux.dev>; Fri, 24 Feb 2023 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Z2k3uhGM1mFQRxjY65KZb2SAot2YZx+BGvC1DEn5A=;
        b=aji8sxAZQ8b1cIhTPkaiHJK+srEp+45Xx4S3DISIzCNcCFdyXPJWlQANMsK0ObnPO+
         olTwlYHERBgsNdwg0z6qbqdwg6AbeO/akzM61PEv/+eivk0nV0Eepf9ZJv3K5WMnbO7/
         sVCQHtqBKTv1f3eXdNwYlj53Up/xRhUQM2y3ZVPgl3Qtzf3l7FGAd2jFsOF2Kx2vU+yv
         xrplZhufJEizVwWwWY3n0ullcCU04ttij7QOLEMXoZddjEEFwwP60X45ZKEY/Dk28tec
         BDalhFPi15YlrO8zDSr1LnmmvUvarj0KPMJjtGmr7og5xZtsf3DsP3kro35n+IX5wh+7
         QJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/Z2k3uhGM1mFQRxjY65KZb2SAot2YZx+BGvC1DEn5A=;
        b=ufvNYlMwChqN2QEz4+4d7nSroBmtbJ78C1dz2F0bke224XjunsOCwe1G6PEqi0wYp2
         j0vCaIb8csazI3tJsfJx/ifXaooWW+7MoRoTj6+F7aOSUHODmEyeiC1Y/A1s2BUfsOVx
         tEW+LOx65yHMp7dCqN+q396mOOFCGF0UTSTUpy+Oc+CMB5fP9/4fBkEjvKI5Zy0pqBoy
         E8ArljfWQlh8dlpFknfTjdg8p99KbfhdcdQ4RO/zmgFsmOPJjW+vQ/oAE/2U2zFajY8E
         s1uwUUlHSG/J4DvE+Riw6iZd7ANu0RNGQRkU/QOOBDtXONWgxm8z2FJmSlqYyAVI9VpG
         ZE3Q==
X-Gm-Message-State: AO0yUKUZmVNJW1D+7RIs+ZsaaVB6X8FrPkCdZfGDJj33FAmapiJznjaf
	s5tNREKxsz4DhJMziV0AyRY=
X-Google-Smtp-Source: AK7set9Mtdu29Yf04ZhDdSBgs2apjDJ293D2pS7KKtWtozcLW7fZUhcEdHk0+a2ZB/0b5BqX017e0Q==
X-Received: by 2002:a5d:690e:0:b0:2c7:1e52:c5a8 with SMTP id t14-20020a5d690e000000b002c71e52c5a8mr1327995wru.21.1677236981951;
        Fri, 24 Feb 2023 03:09:41 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c350a00b003daffc2ecdesm2731291wmq.13.2023.02.24.03.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 03:09:41 -0800 (PST)
Date: Fri, 24 Feb 2023 14:09:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rohit Chavan <roheetchavan@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme: remove unnecessary parentheses
Message-ID: <Y/ia7a6YdjpfUAx4@kadam>
References: <20230224105048.758-1-roheetchavan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224105048.758-1-roheetchavan@gmail.com>

On Fri, Feb 24, 2023 at 04:20:48PM +0530, Rohit Chavan wrote:
> This patch removes unnecessary parentheses in order to fix a checkpatch issue.
> 

This line is too long.  Commit messages can only have 75 characters
per line.  Please run checkpatch.pl on your patches.

But also Greg doesn't like the "unnecessary parentheses" warning so just
ignore checkpatch for those warnings.

regards,
dan carpenter

