Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E606373
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 02:49:01 +0000 (UTC)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 1BF9E3B95D;
	Thu, 13 Jul 2023 22:48:55 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:references:mime-version:content-type
	:in-reply-to; s=sasl; bh=SgIJz7mmb8KnUA+ivOGmsW6RyQgzeGYwa1Kwp8+
	hCMI=; b=GNa4NRsVPatdAJC2I/VkGv5s911BygoHjjs9zUnGluHqnxzv2HXqOdT
	opOnUsP8JLbRekOIrg6HZcCmbpYIvIN9lPHW8OwBqK1QDHqSKkr/DDi+acr+fF38
	+LiHPIoSGDQEZaxdT3Gznu/N3WM2CHnVgwiqRmobcsjnrvmL4gu4=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 138CA3B95C;
	Thu, 13 Jul 2023 22:48:55 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type:in-reply-to; s=2019-09.pbsmtp; bh=SgIJz7mmb8KnUA+ivOGmsW6RyQgzeGYwa1Kwp8+hCMI=; b=Yzl0XM0rjRBBkye2NyiGKiv0fLrX30P8mU1PmS6fuSTsLu1XrRtasq7AXHmDQ6C0AWeADeicl/oiSuILVCF5RQfVwyb1GdCFpcTRKqrtRm4cnYf/eUaQ5o+tQPTJZ2zT6fFVYKgC4yQdEwuqx7mu6fTllEJAFfprATUzRY0Ueko=
Received: from basil (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id 65BF93B91E;
	Thu, 13 Jul 2023 22:48:51 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Thu, 13 Jul 2023 19:49:39 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, anjan@momi.ca, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/12] Staging: rtl8192e: Rename variable pBA
Message-ID: <ZLC3w4tjw16LwuEa@basil>
References: <ZK84sYjc9uHIWZcr@basil>
 <724b252e-0c72-6c77-4817-aee8d87a99cb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <724b252e-0c72-6c77-4817-aee8d87a99cb@gmail.com>
X-Pobox-Relay-ID:
 F70F9A34-21F0-11EE-878D-C2DA088D43B2-45285927!pb-smtp20.pobox.com

On Thu, Jul 13, 2023 at 11:54:40PM +0200, Philipp Hortmann wrote:
> On 7/13/23 01:35, Tree Davies wrote:
> > Rename variable pBA to pba in order to Fix checkpatch
> > warning: Avoid CamelCase
> > 
> > Signed-off-by: Tree Davies<tdavies@darkphysics.net>
> > ---
> >   drivers/staging/rtl8192e/rtl819x_BAProc.c | 106 +++++++++++-----------
> >   drivers/staging/rtl8192e/rtllib.h         |   2 +-
> >   2 files changed, 54 insertions(+), 54 deletions(-)
> 
> 
> Hi Tree,
> the p is typically for pointer. This is not wanted when you change the name.
> But ba is is in use....
> 
> Bye Philipp

Thanks Philipp,                                                      
                                                                     
A few thoughts...                                                    
Looking at occurances of pBA, they all appear as local variable      
declarations of struct ba_record, mostly as function params.         
                                                                     
I also see what you mentioned, as BA being already taken in          
rtl819x_BAProc.c:394 and line 292, but I don't 'think' that renaming them
both to ba will result negatively(?).

Agreed, let's wait on Greg.

Cheers!
Tree

