Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8FF1848
	for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 08:25:45 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94ed301bba0so214121366b.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Apr 2023 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681719944; x=1684311944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvuR+wqBIrNMrDF8yas5oBzfAoNG26JbDTdN+RQDtGw=;
        b=DaJSuynxS/haARK9PTSpDSLYg59airZVDOBfgXmSmeteDKO+D8IpH/EzRdVDSvNuIk
         DwZNWNhX3L9irYaBz9Xon5MqgNIUb4kjEmbaYnXx3/3UfZe4QyFkDrcqYPOrKgvaP47G
         Gri9qX2xgHYtezDXRvffm3KXFbKbp9fpy25XxevbqkJSF56t8F2TSCQiXrIwt+8GCdzV
         FEZpSIBxhXkm3wbSmc5DYymvZnco7ckWL7yHuwZX28nkT+/0P9ZfttdGxaycAf94zoEF
         +n9kjh9ct32+ldkiAiOkRyhtQ7ZY7Rcvfnw7TR+ImPUYs7IPbfGoNhO7G2b+OIrkatMi
         cuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681719944; x=1684311944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvuR+wqBIrNMrDF8yas5oBzfAoNG26JbDTdN+RQDtGw=;
        b=Z8C9EyxwwKBawEgYfpdCwoDH68GTQOvj3UDtzC5MqgMvULazP7NFLUNrxqp/y8KBxF
         YKD8RT6ippHM9nnVGpmiZJrfSZNxCcGasRGG9wgdSv8js0vfI/AskNxUTWqxiiKXYyKj
         /86813TbgkgfiNUCAOWkWJDIcY22kNbBQhJIBr+eNpqf2eRtL6JQYauvstqIQ0fZom1/
         9/3RD5LK7bSK6Tcy9Z7O0tR9OOnXQD1Nn7t6BgkYmhltnN1ZVMQ8IhkzoEegWdKzRasv
         k386aSVuWh3eOz+uf4Fpykrp/N2UyH8Y/HFrQiA+my7/C1EOeLx4RXffSVqYu9eSLiT2
         sRFg==
X-Gm-Message-State: AAQBX9dxGnYTbb/oVHo3rIfXVZBzJSjdYTUogPCbVLbwfjgbyba9vJDN
	y2jIaO33LzuOK81BGMV15CM=
X-Google-Smtp-Source: AKy350Zf+Dfcj30vv6PpXttbnXz/ncOUNytjrL8S4yP33+cxyVPefed+V98dsjjZRl8Eh2DL27odLg==
X-Received: by 2002:aa7:c2d4:0:b0:506:bdc:49c6 with SMTP id m20-20020aa7c2d4000000b005060bdc49c6mr13411195edp.23.1681719943805;
        Mon, 17 Apr 2023 01:25:43 -0700 (PDT)
Received: from kernelhacking.kernelhacking.example.com (dslb-088-067-245-126.088.067.pools.vodafone-ip.de. [88.67.245.126])
        by smtp.gmail.com with ESMTPSA id wy6-20020a170906fe0600b0094ee88207d5sm4573814ejb.191.2023.04.17.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:25:43 -0700 (PDT)
Date: Mon, 17 Apr 2023 10:25:41 +0200
From: Luke Koch <lu.ale.koch@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: replace rate macros
Message-ID: <ZD0ChREQnV8tKwS1@kernelhacking.kernelhacking.example.com>
References: <ZDqwZKZHyZZX4b2J@kernelhacking.kernelhacking.example.com>
 <f44f44e4-25c0-4489-96e9-8ca63fa294d7@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44f44e4-25c0-4489-96e9-8ca63fa294d7@kili.mountain>

On Mon, Apr 17, 2023 at 11:04:04AM +0300, Dan Carpenter wrote:
> On Sat, Apr 15, 2023 at 04:10:44PM +0200, Luke Koch wrote:
> > +	for (int i = 0; i < 8; i++) {
> > +		if (count > i &&
> > +		    DOT11_RATE5_ISBASIC_GET(item->supprates[i])) {
> > +			req->basicrate[i] .data = item->supprates[i];
>                                          ^
> Could you remove these spaces before the .data and .status?  Otherwise
> it looks good to me.

Sure, the spaces must have been leftovers from the token pasting and I
unfortunately overlooked them. Thanks for reviewing!

Best regards,
Luke Koch
