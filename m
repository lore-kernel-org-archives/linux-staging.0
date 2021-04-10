Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B171
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 02:12:41 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id nh5so3756728pjb.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 19:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hbVf4wVfNxnKZxFZJSlPx/JJraXw3lheZgCYNdZrqqk=;
        b=lOYTBpnhtHMJ+6GMN0ThIPlxCD/e4HCWnsMR4Dcd1BxZ0UNCjmAZu4EUCDAVPOfcI0
         0QV8/GiuXZ+nGbLOxRUptkSwDmwb3iKzNuS15pDZtp8HKIJNGsGt5E3kibZtMDMtEu0P
         5s713UzUcpIN7JYQnm+eOHdv6EzeACJBi7I1ET0YeKkfn1oP4wPOQBU/oLc8udgC8aSQ
         u0d9LIv/jJeh57b897fxDpm22+CNFUMv02TuKYayNqqgY/7IrxYHFxKduijD5V7YAnOE
         e47ImFrcn2JUfsld0N7m0B4CuT9FvX2J3qsw7D1IJrJA4RyTrlr2kTmZPfXByK41iRi3
         GEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hbVf4wVfNxnKZxFZJSlPx/JJraXw3lheZgCYNdZrqqk=;
        b=YQRIvJdVOEvwRvm9qP6oOXIhK+QFinWlpvrKQ4smyZa83I0uSh8RBtLeS5L7jWfbh3
         PYBMPRrqyW80SWIEqs9arp1huoSZNMYudmcXNirY8klW7NFEZtqDl7x72DeauWNcw8Qy
         FFCC2GS6cX4CM9Anem+AmT9qu0LvqTLJEZRb0dTdPxPFXI9R3dJc/RKcOhY5xqs+i8lZ
         zwqEVh5TEkBEKLYQBpI1Pd5vAYyAH17El7Z+YNqs2e3pwUtFNxjtEWCRJZWGhG3ICDks
         eZFJSGgdxMJesxTubuZjz2xb+MIpM+0IBIa7fwRMw68WtIbRcpaSIYGKVsHFfBH/Nnln
         sALQ==
X-Gm-Message-State: AOAM532GMqIzs5iPXtD+SefHs4oAGwLIAi+4iccRntoaZMIdS+YJKZiY
	JrJQLSyjt2Qr6pFU4+1qwgU=
X-Google-Smtp-Source: ABdhPJwJB6ivjOBcNbWw7+jzcWHtaUcg6VB2TwA5G+81NUFgSFyq4cP5dU6bxiBGchpYzVGKjfW+tA==
X-Received: by 2002:a17:90a:a616:: with SMTP id c22mr16336354pjq.94.1618020761057;
        Fri, 09 Apr 2021 19:12:41 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id x13sm3523524pgf.13.2021.04.09.19.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 19:12:40 -0700 (PDT)
Date: Sat, 10 Apr 2021 07:42:34 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH 0/3] staging: rtl8192e: cleanup patchset for style issues
Message-ID: <YHEJkknTdEwID9X+@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These patches fix the cleanup style issues identified by checkpatch

Mitali Borkar (3):
  staging: rtl8192e: replace comparison to NULL by boolean expression
  staging: rtl8192e: remove unnecessary ftrace-like logging
  staging: rtl8192e: remove unncessary parentheses

 drivers/staging/rtl8192e/rtl819x_HTProc.c | 26 ++++++++++-------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
2.30.2

