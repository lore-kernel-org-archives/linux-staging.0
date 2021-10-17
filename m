Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F06D72
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:52:10 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ads00EKr/4iry/VVJ+OseFNkaV5oseYIsimQD?=
 =?us-ascii?q?101hICG9E/bo8/xG885x6faZslwssTQb+OxoW5PwJE80l6QU3WB5B97LYOClgh?=
 =?us-ascii?q?rKEGgI1+XfKlPbdxEWutQtt5tIQuxOTOf9ClV3lq/BjTWQGdxI+ra6zJw=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="396157498"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 11:52:07 +0200
Date: Sun, 17 Oct 2021 11:52:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Kushal-kothari <kushalkothari285@gmail.com>
cc: linux-arm-kernel@lists.infradead.org, mike.rapoport@gmail.com, 
    kushalkothari2850@gmail.com, outreachy-kernel@googlegroups.com, 
    gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
    linux-staging@lists.linux.dev, nsaenz@kernel.org, 
    bcm-kernel-feedback-list@broadcom.com
Subject: Re: [Outreachy kernel] [PATCH v2] staging: vc04_services: replace
 msleep() by usleep_range()
In-Reply-To: <20211017092900.134752-1-kushalkothari285@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2110171140040.3026@hadrien>
References: <20211017092900.134752-1-kushalkothari285@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 17 Oct 2021, Kushal-kothari wrote:

> Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
> msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)
> in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.

In addition to Greg's comments, the log message is still not really ideal.
There is still the word Fix that doesn't really contribute anything.  The
prototypes of msleep and usleep are also not useful - the reader either
knows them or can easily find them.  A better messge could be something
like:

"Checkpatch warns that an msleep of less than 20ms can sleep for up to
20ms.  Replace msleep(1) by a call to usleep_range that makes the possible
range (1ms - 20ms) explicit."

But the argument to msleep is in milliseconds.  If the appropriate first
argument to usleep_range is 1000, then it would seem that the second
argument should be 20000?

One thing that you can do to try to understand such a problem better is to
see what others have done before to resolve it.  You could try a command
like

git log -S msleep -p

to see commits that have changed the number of calls to msleep.

I reiterate Greg's comments that making these timing changes without being
able to test the result is risky.  These are just suggestions of some
methodologies that you could follow for a change where it is more clear
that the change is correct.

julia

>
> Signed-off-by: Kushal-kothari <kushalkothari285@gmail.com>
> ---
>
> Changes from v1: Reword both the subject and the log message.
>
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 6fbafdfe340f..80a7898c5331 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -857,7 +857,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
>  		if (status != VCHIQ_RETRY)
>  			break;
>
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>
>  	return status;
> @@ -894,7 +894,7 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
>  		if (status != VCHIQ_RETRY)
>  			break;
>
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>
>  	return status;
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20211017092900.134752-1-kushalkothari285%40gmail.com.
>
