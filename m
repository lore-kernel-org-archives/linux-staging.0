Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14A1FD0
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 16:21:44 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso2176215wma.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WQX52qYY8bg6hGfzOSBwUaKCGbHm9EJC/8UwMWYqta8=;
        b=oGf1ai2dAr+KbSX8nBOEFBiYefkx7CVNfmTOcirjviv6oF3MDfm8t9oW+NMzK0Vhhm
         /Op7M7jwjnfAg6bLlRUf0fPMJfYbY992TOQCEufmOqYsop2KcnWE2vRqM+4CBQbN2+no
         Rw8cNkaHgYsXaVTtSc+2ZskUXtG6f88atEa4xmit9z+MFvYVoDr/lmARF5FpHlDYCoXM
         6qmvmp82b6jemVOGf3jCxVW+sDjBdye+XM/5vbUcgwsnyh8DQHvZhAU2TuphI7Qg8HMw
         8whP4GlCBAvGMJSb6YUXJrifUua5I92E2BjBSlV0G+44KPWcKbc6VEpYEPMRHSGsuG2z
         yepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQX52qYY8bg6hGfzOSBwUaKCGbHm9EJC/8UwMWYqta8=;
        b=Ul98ZoyQ6mHRmeWbMUA4W7sfT+0lvPCi9vgF6rulneEE0fC8hC0VZTeOnR7LgYUiVV
         ohL+cagT+Q9ldIvaxdULYxlUPHfKOvIlwtIf03ySNbLKPF62T1HSwXtNgkXoips6OzVn
         YKl2uaHDCnWNtJ3OglLb2q+1NA1bMA5a6Mozi/wpBv04SWX3YiDRVx/lrVeP8wkYq+l6
         WfSk2mxk4XgOrS+F/Tf2Uq0fys9UtH6czwpdh4mFkCfED/6KOPLPchov6rxuGL7495Y+
         CdDY+Fhq3SfLzLsMrLL6fjzmyYIx2DYCX2GoEakpkDRFlWNj6aLrfxf4mvKXiF1jUfB9
         4GoQ==
X-Gm-Message-State: AOAM533f5lr/uDv7kNMOubzefVEVBPAZh+he8QSC7TFjdPc4XlijAYYm
	HHGd4gErd7wcbv+KCzAT6Zg=
X-Google-Smtp-Source: ABdhPJwjkMvZyqLFG0sCHtMfhXXc+rnNiU+6PHYsFUbDEQ/8Oeh3KJV3n+MLBC0VwX3mYmmysHJimw==
X-Received: by 2002:a05:600c:3593:b0:38e:a8a2:abe3 with SMTP id p19-20020a05600c359300b0038ea8a2abe3mr4932472wmq.149.1649780502596;
        Tue, 12 Apr 2022 09:21:42 -0700 (PDT)
Received: from leap.localnet (host-82-60-208-254.retail.telecomitalia.it. [82.60.208.254])
        by smtp.gmail.com with ESMTPSA id u7-20020a05600c19c700b0038cc9aac1a3sm3011747wmq.23.2022.04.12.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 09:21:41 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liu Junqi <liujunqi@pku.edu.cn>, Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Colin Ian King <colin.king@intel.com>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: Remove D. Kershner from Unisys S-PAR maintainers
Date: Tue, 12 Apr 2022 18:21:39 +0200
Message-ID: <1683735.QkHrqEjB74@leap>
In-Reply-To: <CAMhs-H_JJ7JVccYjdoj5opTt6R5CHRBwQ05tXPuFgenpCuyy4w@mail.gmail.com>
References: <20220412103629.8029-1-fmdefrancesco@gmail.com> <2976258.CbtlEUcBR6@leap> <CAMhs-H_JJ7JVccYjdoj5opTt6R5CHRBwQ05tXPuFgenpCuyy4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Sergio,

On marted=C3=AC 12 aprile 2022 13:30:43 CEST Sergio Paracuellos wrote:
> Hi Fabio,
>=20
> Check this patchset [0] I sent a bit time ago removing two drivers from s=
taging,
>=20
> Hope this helps.
>=20
> Regards,
>     Sergio Paracuellos
>=20
> [0]: https://lore.kernel.org/all/20211113192045.32153-4-sergio.paracuello=
s@gmail.com/T/

Thank you very much for the link to your patchset :)

I have just taken a look at it. I'm pretty sure that it will be very useful
for accomplishing the task of removing the unisys sub-tree. I've planned to
do this work by the end of the current week.

Regards,

=46abio M. De Francesco


