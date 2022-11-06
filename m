Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99629A9
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667749984; bh=dmKfIeO1VeBT4R+Kq0XhzSljt+SmVaKK6PEqQdi6PAA=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=LmoUC3G34R1DwCWQ+F1NNFrRF2PorUAQehSztPMaLCENSzQYuwI+Pmd+oWDbGEujg
	 IUU+5pQt7e1bReIBuJtgduu9nWmyF8lIjK5hsPvhEeyHtWwyidJeb1Rl40KIwa5x0v
	 oMTkcxjFdpfmLwSFMp0pJWbpAEmhw7dLI+Lgp9vA=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sun,  6 Nov 2022 16:53:04 +0100 (CET)
X-EA-Auth: 9t6s0BerjpqO1VYQo8v6OMTRabzSBetVRZqnZqWKLooLO7w9iv/byaeqo9eiQoRh15bx9tbDz930YaQtsUqfGmA0p3kX7sdT
Date: Sun, 6 Nov 2022 21:22:55 +0530
From: Deepak R Varma <drv@mailo.com>
To: Michael Straube <straube.linux@gmail.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: clean up error handling in
 rtw_start_drv_threads()
Message-ID: <Y2fYVzU6JDxocTdC@qemulion>
References: <20221106133443.8872-1-straube.linux@gmail.com>
 <Y2fGGsV5ZwxmkTNB@qemulion>
 <5fa89086-c81d-0a3d-8d0d-0bb293052c5c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fa89086-c81d-0a3d-8d0d-0bb293052c5c@gmail.com>

On Sun, Nov 06, 2022 at 04:34:57PM +0100, Michael Straube wrote:
> On 11/6/22 15:35, Deepak R Varma wrote:
> > On Sun, Nov 06, 2022 at 02:34:43PM +0100, Michael Straube wrote:
> > > Convert the error handling in the function rtw_start_drv_threads() to
> > > the common logic used in the kernel. Another step to get rid of _FAIL
> > > and _SUCCESS which uses inverted logic.
> >
> > Hello Michael,
> > Can you please tell how did you find this opportunity for improvement? Are you
> > using some tool or is it a manual code review/analysis?
> >
>
> Hi Deepak,
>
> I just used git grep to search for _FAIL or _SUCCESS and then looked at
> the code manually.
>
> Regards,
> Michael
>

Okay. That is very helpful. Thank you Michael.

./drv


