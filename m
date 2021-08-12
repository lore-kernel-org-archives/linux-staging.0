Received: from mx-lax3-1.ucr.edu (mx-lax3-1.ucr.edu [169.235.156.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DD70
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 05:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628747489; x=1660283489;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=l3zfLLXduZiIZzfIz0+CTNmC/Omgz4giYTeAfSD4EzE=;
  b=BFeA3aj/SiP9Yb1ZmUDSqSG5HhMqfFEVpMKVmkW/2GVds9PDdniaTFJ+
   jv7jjYzZ0MlYG+rbbRBAQc/NMNA3423BI4WI04TkWcxiqmnsV8H0K40fM
   XC+kV8h4fuOnkeEbIhkB3Y3BlGXw/B0YHwrHm9hxmLni1ZF32wOMLXAfr
   d7//YaGMwSGWmhBwZnlKs7ILpp30z1jaIkjyqALX3FuLgB6BOZJLCeT9d
   d5+yiVq8jxcwJ9njEDrYlQSLiwXjyWUwCcOzVP4M0WzjzkEiRSzYtLGAO
   Nm3l2sX3jFt14mXJ8J4sC2VXNN9nrdqD93rZwGt1VmaGO28oSEr9UyLGo
   w==;
IronPort-SDR: VbwpVeNwFOYpNvaRSVWESQ6AriPiBj6huG0RSgX3dCjUieuvy8+6smv8ZZu0dj301w9OlO2P6y
 j+R266yOBRs8BUosAH0u8n+57vK9c6BHfNNphB/CqKIAmkaMI5CoZj9OIpbqZPODVMZuAdBwjm
 fhh4dKlwJcE3zX3H04KzAcx95nh5cuOnaE2ACmQaemdCG3JaX8A9BrqNTW1fP1ZC382npadaLV
 hOC2lVVDD8zlVI1eE/t6NHkwMeMnjnNooc2qAfCG5yMg9JyoaFsQ6dPYAHX99EtBYzny6LbJgF
 BrtR5f1nZL92yks38x6FoD0K
X-IPAS-Result: =?us-ascii?q?A2EnAwDGtRRhfsfWVdFagQmBWYN4bIRIkXCbY4F8AgkBA?=
 =?us-ascii?q?QEPQQQBAYRZAoJnAiU1CA4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBAQUEA?=
 =?us-ascii?q?QECEAEBgSILWQtjgU+BeQYEPYI1KQGDbAEBAQEDEhFWEAsLCgMCAiYCAiISA?=
 =?us-ascii?q?QUBHAYTIoVXnh6BBD2KOHqBMYEBiBwBCQ2BYxJ+KocMhmQngimBS4JvPodbg?=
 =?us-ascii?q?mQEhUQPggOBGwEBAZNbiU2CCZsGghEBBgKDDhySS4wCK4NTkXKRK7tGECOBP?=
 =?us-ascii?q?wKCETMaJX8GZ4FLTQECAQIBDAIBAgECAQIBAggBAQKGYpYqJC84AgYLAQEDC?=
 =?us-ascii?q?YkWAQE?=
IronPort-PHdr: A9a23:/ds2NxP+EW5RlKgJwmwl6nYZDRdPi9zP1u491JMrhvp0f7i5+Ny6Z
 QqDv60r3AWCDdmTwskHotKei7rnV20E7MTJm1E5W7sIaSU4j94LlRcrGs+PBB6zBvfraysnA
 JYKDwc9rDm0PkdPBcnxeUDZrGGs4j4OABX/Mhd+KvjoFoLIgMm7yfy+94fQbglWizawYrx/J
 wiqoAvMscUbnZFsIbsrxBvTpXtIdeVWxWd2Kl+Wgh3x+MS+8oN9/ipJo/4u+NJOXqv8f6QjU
 LxXFy8mPHwv5M3qrhbMUw2C7WYBX2oMkxpIBw/F7AzmXpr0ryD3uPZx1DWcMMbrVr0/Ryis4
 Ll3Rx/pkCcHNiA28GfLisxrkalXpAutqwFjz4LIZY2YMud1cKHActMAXWdOUchRWC5BDI2yb
 IUBEvQPMvpDoonhu1cDtweyCRWwCO7tzDJDm3/43bc90+QkCQzJ3g0gHtMOsHTJq9X+KaQdU
 eCvw6nJ0D7OaPNX2Db96IfScxAtve2AULxrfMrM1UYvDRnJgUuNpoz4Jj6Y0PkGvGeH4eR6T
 +2vl3InpB9rojip3sohhY3Ei4YVx17K6yl0z4I4K9K7RUN0b9OpEJVduj2bOoZqQ84vTWJlt
 Dsnx7EbupO2YiYHxZskyhPCZfKKbpSF7xT+X+iSOTd1nGxpdK67ihqo8kWtyvfwWtep3FtFt
 CZJj93Bu3QL2hfO8MaIUOF98V2k2TuX0gDT7fxLLl4smKrALp4h3qYwlp0OsUTfBiP2mFv5j
 KuRdkg8/+in8eXnYrH/qp+EM494lxjyMqozlsG7Bek0KAcOX2+c+eSz0L3s41f1T6lNjv0zi
 qXZsZbaKtoHpqOhHQNZzoIu5wy8AjqmytgUg2QLIV1fdB6ai4XkP0nCIPXiAve+h1Ssni1rx
 /fDPrD5ApTML3jDn63gfbph90JRxhE+zc1D6JJOEL0OPu/8WlLpuNzCEhA5KxC0w/rgCNhl0
 oMeWGSPArKWMa/Lql+I+vggI+aNZI8TtzbwMPwl5//1jX8lgl8RZ62p3ZoRaHClEfVqOViWb
 mTygoRJLWBfkRAzQ6TJklqLUXtzbmyuWqs6rmU0Eo+pDofrQoGrnayP2zq9EpRKZ2dATFeWH
 iG7WZ+DXqI9aTCSP8gpoDwNVPD1Wp0h3BD27FTS1rF9aOfY53tL5trYyNFp6riLxlkJ/jtuA
 pHYijnVJ1w=
IronPort-HdrOrdr: A9a23:V+UYlq+eW3MrHwtY915uk+DjI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzuiWE7Qr5NEtQ++xofZPwIk80lqQV3WByB8bHYOCOggLBR72Kr7GD/9SKIVyYygcy79
 YHT0G8MrDN5JpB5/oSLDPWLz/o+rXozJyV
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="59848121"
Received: from mail-pl1-f199.google.com ([209.85.214.199])
  by smtp-lax3-1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Aug 2021 22:50:20 -0700
Received: by mail-pl1-f199.google.com with SMTP id p21-20020a1709028a95b029012c31764588so3018289plo.12
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4OvCfZOoMFqcsG6QeShyHGwKu7LE5OaUGDpdUOU7Sw=;
        b=gmEZY5PNMH8Kne0pwVAvV7DD3cNahaX+b+etaIdZxRba1Tv0GwZZ264ba0g40ZvlTr
         aTLfveFUxSE+Owp2znoq9/0tMblHKPH59gVh/F+Lyq8O4dUPzWo0QYeTwGtNsQfZsRln
         Jhckz5u91Wc05+nlm+MwFk7IJO3iYW66U6vLbaLwXOEE/my6JfK3bEq4D4C51QfVWswj
         FjXhF3Tan2NLux4bG5TZUlDLAI8SL576RIlAxw2Z+Y0B8b7h7h9SLG8m98qWzY3L4lMb
         k0sly0PzXR1zc6kDonAzn+7y+vyfsd23PGrr8ro9nJM7RQvHfi51k9kh08/mvDt/9ges
         2cJg==
X-Gm-Message-State: AOAM530D6FEtu0B84GjOPCobIsi7CFFWO5sK0T0hinZA3MVQHewC2ZXr
	5wYpCEyw1ocHHDy179cVNhB2ghjAN97aKtrPEowxbZzYiVH8qF4H12hNeHEjZX6siT872OOHXhL
	/IIIOhxjjRHcUAtux8gFiq14mRfIlglV8KNXH2cHVjsE=
X-Received: by 2002:a17:902:6a82:b029:12d:2431:94c1 with SMTP id n2-20020a1709026a82b029012d243194c1mr2218874plk.63.1628747419503;
        Wed, 11 Aug 2021 22:50:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziwkiqjDIjmuU3dBBadKSg7FwSBsBGxojfwp4aZ97za34xeBhSer8/cICJlIdqG3lupuTxRl5mIIhZQ1ByBGw=
X-Received: by 2002:a17:902:6a82:b029:12d:2431:94c1 with SMTP id
 n2-20020a1709026a82b029012d243194c1mr2218856plk.63.1628747419252; Wed, 11 Aug
 2021 22:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723003607.64179-1-yzhai003@ucr.edu> <20210811035405.17382-1-yzhai003@ucr.edu>
 <YRN11JOX/JHpq8Yn@kroah.com>
In-Reply-To: <YRN11JOX/JHpq8Yn@kroah.com>
From: Yizhuo Zhai <yzhai003@ucr.edu>
Date: Wed, 11 Aug 2021 22:50:08 -0700
Message-ID: <CABvMjLSFKVV_uC3n02t=p6X+qaptgZiCrVmy2875OMybN=e+Jw@mail.gmail.com>
Subject: Re: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Greg:
Sorry for the inconvenience, let me fix this issue and send a new one, thanks.

On Wed, Aug 11, 2021 at 12:01 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 10, 2021 at 08:54:03PM -0700, Yizhuo Zhai wrote:
> > From: Yizhuo <yzhai003@ucr.edu>
>
> This name is not matching the name you use in your signed-off-by line :(



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
