Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD5D71
	for <linux-staging@lists.linux.dev>; Mon, 26 Apr 2021 10:07:28 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ASQxsOaCOEXuyQ/PlHelN55DYdL4zR+YMi2QD?=
 =?us-ascii?q?/UZ3VBBTb4ikh9mj9c5rsSPcpT4NVBgb8uyoF7KHRRrnn6JdwY5UBru6WRmjhW?=
 =?us-ascii?q?3AFuBfxK/D5xGlJCHk7O5a0s5bAs1DIfn9F0Jzg8q/wCTQKbYd6eKK+qypmuvS?=
 =?us-ascii?q?pk0FJT1CUK1u4xx0DQyWCCRNNWp7LKAkH5mR7NcvnVSdUEkQB/7WOlA4ReTZ4/?=
 =?us-ascii?q?XEmJX6CCR2ZSIP2U2+yQml77P3CHGjsys2WTkn+9gfzVQ=3D?=
X-IronPort-AV: E=Sophos;i="5.82,252,1613430000"; 
   d="scan'208";a="379678700"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 12:07:20 +0200
Date: Mon, 26 Apr 2021 12:07:20 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, David Kershner <david.kershner@unisys.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Outreachy kernel] [RFC PATCH] staging: unisys: visorhba: Convert
 module from IDR to XArray
In-Reply-To: <20210426095015.18556-1-fmdefrancesco@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104261205500.5891@hadrien>
References: <20210426095015.18556-1-fmdefrancesco@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> @@ -273,8 +260,7 @@ static int forward_taskmgmt_command(enum task_mgmt_types tasktype,
>  	if (devdata->serverdown || devdata->serverchangingstate)
>  		return FAILED;
>
> -	scsicmd_id = add_scsipending_entry(devdata, CMD_SCSITASKMGMT_TYPE,
> -					   NULL);
> +	scsicmd_id = add_scsipending_entry(devdata, CMD_SCSITASKMGMT_TYPE, NULL);
>  	if (scsicmd_id < 0)
>  		return FAILED;
>

As far as I can see, this is just a whitespace change, so it shouldn't be
in with the rest.  If you make whitspace changes, they should be in with
the other code that you are changing.

julia
