Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BB0101F0;
	Fri, 13 Oct 2023 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/56h6jT"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c9bf22fe05so14235125ad.2;
        Fri, 13 Oct 2023 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697183192; x=1697787992; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONEtd5adg39vVEfE7cPhn5HoULJU19wWn5zWrGwz3uU=;
        b=f/56h6jTkixhqGieDhNkRewGppA/y30VGMMMpPDEBmEhVT4pPXOe3zG/LsoEdviRCr
         IlrU0VTtSFGuu89Pk4ERYukLZVSWOs+t7mgOuzBT1Bj5g3fkiM434GoXbkB3wQoR7Evl
         KzWqKyMZ+WF9VLv4dMxak+NP8H519/BSuoDViKsegO9oOwEFwnWLGWbKm78ORlDp5o9y
         zA2mK6HSIEvT1Rz3wAJvHjdg1zofWf3Y06oxJSxT50RW5t4mRV3sKPGP+YAsbLvJxgIR
         TlcthNv4wnslXKp5RAjhjSkrxYCUIkPDi+5F11vIYZMjI4z8sz1xQFOcXG6Jc3v8P6t6
         jo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183192; x=1697787992;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONEtd5adg39vVEfE7cPhn5HoULJU19wWn5zWrGwz3uU=;
        b=pIg8e5iWDvG2P/qbEiOt67oR5eG6bSvpVsRw6EOQuD+4zyp3R6/g6LvfrzNEqEec60
         WHnCc3t4CADfusXDq0Nk176guvQpyZX3MAp/8ksjvaXqf99HxWlwQiyzsjxU0Qlq0EkQ
         GjLfO3ooC4txZ5z3rcpSCsYw8JUTDKdYZCjHQDdxQBe2jbCKNGXd0kjBiIdaeVhRj7u6
         E8O4nNEcOB7CqaqmOWvXFsVRyGU2mbE8Dv5hbrF6DbtFtjZKQCymjXVGvRvraiLke6gc
         QCbiyxh24KaK4z2zQkKbYrG0lBvpKLOSHGTPBc5gB6YHcYe3jsNf9WZ7oIPjtYV8tO+5
         40qQ==
X-Gm-Message-State: AOJu0YxRir1uun/kJv+FAygqgHzDHhoZ4Ku1R0n9DeLjAdUbIBg7VyeL
	jnShbRTmnmKmnq1eAqmPKnE=
X-Google-Smtp-Source: AGHT+IHdj4hWI9QDZoRoom2rrLFcswJC3qktGs2uGiXeoRIN1FIsvldczfAxcufpP2JJo8ppli4oew==
X-Received: by 2002:a17:903:2441:b0:1c3:61d9:2b32 with SMTP id l1-20020a170903244100b001c361d92b32mr27275201pls.45.1697183192202;
        Fri, 13 Oct 2023 00:46:32 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id bj3-20020a170902850300b001c61512f2a6sm3175383plb.220.2023.10.13.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:46:31 -0700 (PDT)
Date: Fri, 13 Oct 2023 00:46:31 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rts5208: Fix checkpatch macro warnings
Message-ID: <20231013074630.GB13814@Negi>
References: <cover.1697113047.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697113047.git.soumya.negi97@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Oct 12, 2023 at 05:50:21AM -0700, Soumya Negi wrote:
> In the driver staging/rts5208, checkpatch.pl warns of possible precedence 
> issues in the header rtsx.h because macro arguments are not parenthesized.
> This patch set handles the respective macros differently(as needed) in 
> each patch to fix the warnings. Patches can be applied in any order.
> 
> Soumya Negi (2):
>   staging: rts5208: Refactor macros to static inline functions
>   staging: rts5208: Remove macros scsi_lock(), scsi_unlock()
> 
>  drivers/staging/rts5208/rtsx.c | 24 ++++++-------
>  drivers/staging/rts5208/rtsx.h | 66 ++++++++++++++++++++--------------
>  2 files changed, 52 insertions(+), 38 deletions(-)

Please ignore this patch set. Its incomplete & the rest of the patches
were not sent successfully. I have successfuly resent the complete 
patchset(unchanged) as v2 with an explanation after --- in the cover patch.


> -- 
> 2.17.1
> 
