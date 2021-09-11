Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6E3FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 14:20:22 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mP3rg-0006kU-3D; Sat, 11 Sep 2021 16:20:20 +0200
Date: Sat, 11 Sep 2021 16:20:20 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] staging: r8188eu: remove unused functions from
 odm_interface.c
Message-ID: <20210911142020.zdau6mvkopv6iaiw@viti.kaiser.cx>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> This series removes unused and/or empty functions from the file
> hal/odm_interface.c.

> Tested on x86_64 with Inter-Tech DMG-02.

> Michael Straube (18):
>   staging: r8188eu: remove empty ODM_ReleaseTimer()
>   staging: r8188eu: remove unused ODM_AcquireSpinLock()
>   staging: r8188eu: remove unused ODM_ReleaseSpinLock()
>   staging: r8188eu: remove unused ODM_FillH2CCmd()
>   staging: r8188eu: remove unused ODM_sleep_us()
>   staging: r8188eu: remove unused ODM_InitializeWorkItem()
>   staging: r8188eu: remove unused ODM_StartWorkItem()
>   staging: r8188eu: remove unused ODM_StopWorkItem()
>   staging: r8188eu: remove unused ODM_FreeWorkItem()
>   staging: r8188eu: remove unused ODM_ScheduleWorkItem()
>   staging: r8188eu: remove unused ODM_IsWorkItemScheduled()
>   staging: r8188eu: remove unused ODM_SetTimer()
>   staging: r8188eu: remove unused ODM_Read2Byte()
>   staging: r8188eu: remove unused ODM_FreeMemory()
>   staging: r8188eu: remove unused ODM_AllocateMemory()
>   staging: r8188eu: remove unused prototype ODM_InitializeTimer()
>   staging: r8188eu: remove unused ODM_CancelAllTimers()
>   staging: r8188eu: remove unused ODM_InitAllTimers()

>  drivers/staging/r8188eu/hal/odm.c             | 17 ----
>  drivers/staging/r8188eu/hal/odm_interface.c   | 80 -------------------
>  drivers/staging/r8188eu/include/odm.h         |  6 --
>  .../staging/r8188eu/include/odm_interface.h   | 45 -----------
>  4 files changed, 148 deletions(-)


Looks good to me.

Acked-by: Martin Kaiser <martin@kaiser.cx>

for all patches.

Thanks,
Martin
