Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA00072
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:09:57 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so7713865pjb.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hhz/iZSw+eTxaAKD6erQO6gxj2fpcxGd6dd5TC5JHcU=;
        b=ChimLYGVj9C3Wksd8ymlEPI8lxLxNCOz4pbiYV5Nezbx4JY4GGQfj7BAXgdIndsCNd
         Y9fabsGNYLpUbyITao4PEnrP2WSXT216MsidVzUId+vPD8RKETpA2FkHVfVIMfrA/V5f
         SlAyoA3HNJOxjif8lOmDsBMWrhxqIoaQe0b3L4w+t9Q7HgmpmnAq1QpOYczq/4wgydrj
         R5jW08Xt6fTuvXh6hV0r+b5wqZiZ37CfVeUx4ilPO8ySPkQQY1etmDduRF5l9xXPlElw
         jRGMy6qybhiHmYm7ObZt6svT89P68tNjWqZa80s8C4HZCA2K6ecLvg0BRbQferukYJFh
         iKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hhz/iZSw+eTxaAKD6erQO6gxj2fpcxGd6dd5TC5JHcU=;
        b=BgBCg5j7KisJSMWH+ogy/nD+6n8WQ4l7+Ftjno/LRMgqyV/mw/Ml/lynqbgkZLlGIN
         WC60rB2EeFA+Xy9c6jYAHVxBCjQi6dn8lKU3iHogBag7juENkkqfgP62ZpljGKeE//KL
         mphtZnK8nr8ucr8S94ROZDSlLfxgls1z5PpGLuHrt6WKs7xYo5K/BDl9pz9JIT4N52/3
         fB7Uz88la4c+atG7RTvO3zOcLR/WULirvdzUHfAZFi1t5vsJd36+kBXyFwmGysWY8R4b
         yYxiX4wERR3kFFD+SIWilX9VxFpwKbmTZN1veTjBlFs2/dGlqWFGlBLNrQazsU7tE33E
         juQg==
X-Gm-Message-State: AOAM533qkpeAh66NghpEXFWdtNQGRud3ZqA7Nu4NGjkyPhCz6ENlXvtD
	QZGd7rG7tJo+lv6BCtMY++U=
X-Google-Smtp-Source: ABdhPJyWaNY9rdnpOdY2AGog+bilnrp/+5sZrUlfd+D3oEeZJoQR4Cogh1Od7QpqqUhdOC9FaKExkA==
X-Received: by 2002:a63:4206:: with SMTP id p6mr3667047pga.285.1627024197255;
        Fri, 23 Jul 2021 00:09:57 -0700 (PDT)
Received: from localhost.localdomain ([103.238.106.236])
        by smtp.gmail.com with ESMTPSA id z15sm36861038pgc.13.2021.07.23.00.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 00:09:56 -0700 (PDT)
From: Jignesh Patel <jigs0101@gmail.com>
To: 
Cc: jigs0101@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Martin Kaiser <martin@kaiser.cx>,
	Ivan Safonov <insafonov@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Paul McQuade <paulmcquad@gmail.com>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: staging: rtl8188eu: Line over 100 characters
Date: Fri, 23 Jul 2021 12:38:20 +0530
Message-Id: <20210723070827.5486-1-jigs0101@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722164144.377781-1-jigs0101@gmail.com>
References: <20210722164144.377781-1-jigs0101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dear Greg K-H, Joe Perches,

Thank you for your comments and drawn my attention.
I will modify and submit the patch again.

Regards,
Jignesh.
