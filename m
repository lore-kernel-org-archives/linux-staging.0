Received: from pb-smtp21.pobox.com (pb-smtp21.pobox.com [173.228.157.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CB1FC6
	for <linux-staging@lists.linux.dev>; Fri, 28 Jul 2023 06:26:20 +0000 (UTC)
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 1D84E344D1;
	Fri, 28 Jul 2023 02:26:14 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:references:mime-version:content-type
	:in-reply-to; s=sasl; bh=7BFUhWySqbBc1I+LPXohU2I/Tws2J36B0HPzziR
	HpiE=; b=Fh8lRZfFG+uzDccI63BpLMrxLFIriSbs7Rm9ihEO7LeGIjt/KL5IRxh
	vcq4totafCSZHWRHN4f0E2VEzvmW/TAhx6T5d6ajxWDd5Nuo0vOq/3EN0U/qY4fd
	yz9qlsQ3E3LT4moZCUcFw5auJowcEdi5oE4OBKyxxoRNr6qbTsVg=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp21.pobox.com (Postfix) with ESMTP id 15F57344D0;
	Fri, 28 Jul 2023 02:26:14 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=2019-09.pbsmtp; bh=7BFUhWySqbBc1I+LPXohU2I/Tws2J36B0HPzziRHpiE=; b=Pw4hhsCDIEwNKOjWILcXXrKO39573f9CFBYjJbx+yD3vwhz5HT5r9IAmJJ40OwVoBcHCRvU+aje01q0rp5j6ptxK3z+qjE32UttQ/fBeBOucEUX3M8k30xh25wwwCg4TUoA9mQHE6pGH4l7MHhsWMjarnD/regogQvq1xvGIw5w=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3F7C5344CF;
	Fri, 28 Jul 2023 02:26:10 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Thu, 27 Jul 2023 23:27:37 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Staging: rtl8192e: Function name cleanup series 1
Message-ID: <ZMNf2d615rXJ8O95@basil>
References: <20230728054742.622297-1-tdavies@darkphysics.net>
 <f4aaf5f5-a6b0-ef10-0d9b-fc52035ca309@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4aaf5f5-a6b0-ef10-0d9b-fc52035ca309@gmail.com>
X-Pobox-Relay-ID:
 A48C7294-2D0F-11EE-9F22-B31D44D1D7AA-45285927!pb-smtp21.pobox.com

On Fri, Jul 28, 2023 at 08:16:03AM +0200, Philipp Hortmann wrote:
> On 7/28/23 07:47, Tree Davies wrote:
> > Rename functions to fix checkpatch warning: Avoid CamelCase
> > 
> > 
> > Changelist:
> > v3: Changed patch #5, Rename global function ResetBaEntry to rtllib_reset_ba_entry
> > v2: Sent to mailing list via git send-email, patches are the same.
> > 
> > Tree Davies (5):
> >    Staging: rtl8192e: Rename function ActivateBAEntry
> >    Staging: rtl8192e: Rename function DeActivateBAEntry
> >    Staging: rtl8192e: Rename function TxTsDeleteBA
> >    Staging: rtl8192e: Rename function RxTsDeleteBA
> >    Staging: rtl8192e: Rename function ResetBaEntry
> > 
> >   drivers/staging/rtl8192e/rtl819x_BAProc.c | 44 +++++++++++------------
> >   drivers/staging/rtl8192e/rtl819x_TSProc.c |  6 ++--
> >   drivers/staging/rtl8192e/rtllib.h         |  2 +-
> >   3 files changed, 26 insertions(+), 26 deletions(-)
> > 
> Hi Tree,
> 
> those patches have been accepted and cannot be applied again.
> 

Hi Philipp,

Right, patch #5 was not accepted though. Grep asked to fix it up.
I thought that because it was part of that series I was supposed to
resend as new version.
 
Tree


> commit c928e84ce577262da288c0178c8c77620ba8b430 (HEAD -> staging-testing,
> origin/staging-testing)
> Author: Tree Davies <tdavies@darkphysics.net>
> Date:   Wed Jul 26 23:19:47 2023 -0700
> 
>     Staging: rtl8192e: Rename function RxTsDeleteBA
> 
>     Rename function RxTsDeleteBA to rx_ts_delete_ba in order to Fix
> checkpatch
>     warning: Avoid CamelCase
> 
>     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
>     Link:
> https://lore.kernel.org/r/20230727061948.579480-5-tdavies@darkphysics.net
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> commit 7b31905582358d566332182653a4e5552dba1574
> Author: Tree Davies <tdavies@darkphysics.net>
> Date:   Wed Jul 26 23:19:46 2023 -0700
> 
>     Staging: rtl8192e: Rename function TxTsDeleteBA
> 
>     Rename function TxTsDeleteBA to tx_ts_delete_ba in order to Fix
> checkpatch
>     warning: Avoid CamelCase
> 
>     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
>     Link:
> https://lore.kernel.org/r/20230727061948.579480-4-tdavies@darkphysics.net
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> commit 8dd56eaa9450fb19f6bcc73956b3b1477331d28b
> Author: Tree Davies <tdavies@darkphysics.net>
> Date:   Wed Jul 26 23:19:45 2023 -0700
> 
>     Staging: rtl8192e: Rename function DeActivateBAEntry
> 
>     Rename function DeActivateBAEntry to deactivate_ba_entry in order to Fix
>     checkpatch warning: Avoid CamelCase
> 
>     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
>     Link:
> https://lore.kernel.org/r/20230727061948.579480-3-tdavies@darkphysics.net
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> commit ca77687ae3f6d65fb26a0e1f93b54753af3581fc
> Author: Tree Davies <tdavies@darkphysics.net>
> Date:   Wed Jul 26 23:19:44 2023 -0700
> 
>     Staging: rtl8192e: Rename function ActivateBAEntry
> 
>     Rename function ActivateBAEntry to activate_ba_entry in order to Fix
>     checkpatch warning: Avoid CamelCase
> 
>     Signed-off-by: Tree Davies <tdavies@darkphysics.net>
>     Link:
> https://lore.kernel.org/r/20230727061948.579480-2-tdavies@darkphysics.net
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 
> Bye Philipp
