Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED937A
	for <linux-staging@lists.linux.dev>; Thu, 17 Mar 2022 07:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681E8C340E9;
	Thu, 17 Mar 2022 07:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647501844;
	bh=F2dRhID5MzLa7zIe9Cg6ug4VHOk1DS9AGnDjR7hkQlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2FGs981e4pUVjMgAC7kLmi8wkQc5QZY+Ob8cqpGpnSql8ALnGa8C12fbZNprf/ek0
	 0/3zMUDsxS1rEzXxW8yGzx3fSlMxcM5cYaeoT324J8GTdakXd4tyQzpt0YsDFVyJ2k
	 Mna3O+nUaJskOvYkALs0lmV3zJu4nrnnrNi2Z2Ic=
Date: Thu, 17 Mar 2022 08:23:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Czerwacki, Eial" <eial.czerwacki@sap.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	SAP vSMP Linux Maintainer <linux.vsmp@sap.com>
Subject: Re: [RFC] staging/vSMP: new driver
Message-ID: <YjLiC82wSBO1oUIq@kroah.com>
References: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR02MB73106333FD8FA483FAA0DAC181119@PAXPR02MB7310.eurprd02.prod.outlook.com>

On Wed, Mar 16, 2022 at 06:13:04PM +0000, Czerwacki, Eial wrote:
> Introducing the vSMP guest driver which allows interaction with the vSMP control device when
> running a Linux OS atop of the vSMP hypervisor.
> vSMP is a resource aggregation hypervisor from SAP.
> 
> the driver comprises of 3 modules, vsmp which includes all the api needed to interact with the
> control driver, vsmp_logs which allows reading logs from the hypervisor and vsmp_common_info which
> allows reading generic information the hypervisor exposes, currently only the version is exposed.

Please wrap changelog text at 72 columns, like git asks you to.

Also, why did you not cc: the staging maintainer?  :(

> Signed-off-by: Eial Czerwacki <eial.czerwacki@sap.com>
> ---
>  MAINTAINERS                             |   6 +
>  drivers/staging/Kconfig                 |   2 +
>  drivers/staging/Makefile                |   1 +
>  drivers/staging/vsmp/Kconfig            |  14 +
>  drivers/staging/vsmp/Makefile           |   7 +
>  drivers/staging/vsmp/api.c              | 402 ++++++++++++++++++++++++
>  drivers/staging/vsmp/api.h              |  61 ++++
>  drivers/staging/vsmp/common/Kconfig     |  11 +
>  drivers/staging/vsmp/common/Makefile    |   7 +
>  drivers/staging/vsmp/common/common.c    |  64 ++++
>  drivers/staging/vsmp/common/common.h    |  27 ++
>  drivers/staging/vsmp/common/version.c   |  85 +++++
>  drivers/staging/vsmp/logs/Kconfig       |  10 +
>  drivers/staging/vsmp/logs/Makefile      |   7 +
>  drivers/staging/vsmp/logs/active_logs.c | 112 +++++++
>  drivers/staging/vsmp/registers.h        |  16 +

Without looking at the code, I do not see a TODO file here that lists
the tasks that need to be completed to get this out of the
drivers/staging/ directory.  This is a requirement.

Also, why is this submitted for drivers/staging/ ?  What prevents it
from being merged to the "correct" place in the kernel tree today?

thanks,

greg k-h
