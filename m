Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5246AB
	for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 14:38:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52a39a1c4d5so4361602a12.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Aug 2023 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693233513; x=1693838313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4s4gvqIGyF3PL0WV1Hs8kg7yCGjq/lL5qZsL8CvtqI4=;
        b=eDjJ/trNeUKfJJIPkz1v8S2ENlWGGtY2DO+7pe+A0aot+oko35vujCtMJmSOiU77DB
         PIzAMCM+tjJP+nNFEKt6moLi5MwIuOVIwztwgn7RDIZDYTuxcQ3Ia0wf9etwkSIX2+pL
         lx87il3CaYx6tdsP3BO8FP7kgGlZCCWPns/9jNxkJtGXUx9Ue0E8SYkrN20612xbHjDX
         KliC+vVClrJp5mFnj685dy/qzOPBD0kP6qCAmI/Hp0E3nzWL1C3lCwuX5z3wMIkXpuhk
         WCSiT7aoNMZyzjtOn6M/ZKzgBbLOe3SbnKP/iuD86EL5cZwTuHEsMk/QhLsuj7R5X2M3
         OVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693233513; x=1693838313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4s4gvqIGyF3PL0WV1Hs8kg7yCGjq/lL5qZsL8CvtqI4=;
        b=DYDUVZRsp6rwB165l1XsEM1EhhxAuZNA1vgnvhpCOyaDxzJPNyB7nSts8EtRgoNiZ3
         DyafTxOPxwN4dvTZDK2pWxGiLBWG8E2OT2QIZKantKPL9S4gTz1W1zAHCgBJDL+Mogx3
         u74YXibX0njb2gku52Qj1KcdnHSK85mO1SOI3LuEbxWKPNicUpeASoGyYS8n1taSI8uT
         74nbsBs2ceJnufFIEnOWGtO7vauUJjz7/IuWTj/cSlK/Hpl42W7oQcOVFxwvI0ylTS0J
         1QGOTAeJEIfmv5L0wcx0M311yBg7S4v5qp6sfnCGq1DCqV6njQlEpzPrGoY/1pAufmf2
         RScA==
X-Gm-Message-State: AOJu0YwBKYTZS/wgRB8mqsWoTiNzai2M/QYCbe0oCQR0qkCLdvrb7AtU
	9iTYvgUb1FBQWkJucQUve7XGCraSdMQ=
X-Google-Smtp-Source: AGHT+IE87KzS9bEzrr8Y0EZ6EpGP+ApCQioItRU8nouVpJwSwnNKnYT890IqwGJAU0fJNg6738yCGQ==
X-Received: by 2002:a05:6402:2039:b0:525:4dd9:d247 with SMTP id ay25-20020a056402203900b005254dd9d247mr18298871edb.35.1693233513458;
        Mon, 28 Aug 2023 07:38:33 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id z6-20020aa7cf86000000b00523d5d9bf1bsm4486393edx.23.2023.08.28.07.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 07:38:33 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:38:32 +0200
From: Nam Cao <namcaov@gmail.com>
To: Oliver Crumrine <ozlinux@hotmail.com>
Cc: gregkh@linuxfoundation.org, colin.i.king@gmail.com,
	sumitraartsy@gmail.com, u.kleine-koenig@pengutronix.de,
	geert@linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 1/6] staging: octeon: clean up the octeon ethernet
 driver
Message-ID: <ZOyxaLDCI81W96/X@nam-dell>
References: <cover.1693229582.git.ozlinux@hotmail.com>
 <PH7PR11MB7643C65E067BAB032F930488BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB7643C65E067BAB032F930488BCE0A@PH7PR11MB7643.namprd11.prod.outlook.com>

On Mon, Aug 28, 2023 at 09:39:14AM -0400, Oliver Crumrine wrote:
> Make the octeon ethernet driver better adhere to the
> kernel coding standard
> 
> Signed-off-by: Oliver Crumrine <ozlinux@hotmail.com>
> ---
> v2: Actually send the patch set properly
> v3: Fixed a bug where I forgot to change all instances of a struct
> v4: Actually fix that bug (this is my first patch, give me a break)

Don't give up! You will get it right eventually.

This is not important, but I prefer you revert the order of the change log.
The changes compared to the last version is most relevant, so preferably they
should be put on top.

Best regards,
Nam
