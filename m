Received: from smtprelay.hostedemail.com (smtprelay0150.hostedemail.com [216.40.44.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0370
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 09:43:11 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id C773318046D9B
	for <linux-staging@lists.linux.dev>; Fri,  4 Jun 2021 08:26:39 +0000 (UTC)
Received: from omf04.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay02.hostedemail.com (Postfix) with ESMTP id 285BFDB5C;
	Fri,  4 Jun 2021 08:26:33 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf04.hostedemail.com (Postfix) with ESMTPA id AD175D1516;
	Fri,  4 Jun 2021 08:26:31 +0000 (UTC)
Message-ID: <19651be0dc8706da34658d25195ff122f41ee7c0.camel@perches.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
From: Joe Perches <joe@perches.com>
To: David Laight <David.Laight@ACULAB.COM>, 'Alex Elder' <elder@linaro.org>,
  'Manikishan Ghantasala' <manikishanghantasala@gmail.com>, Alex Elder
 <elder@ieee.org>
Cc: Alex Elder <elder@kernel.org>, "greybus-dev@lists.linaro.org"
	 <greybus-dev@lists.linaro.org>, "linux-staging@lists.linux.dev"
	 <linux-staging@lists.linux.dev>, Johan Hovold <johan@kernel.org>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Fri, 04 Jun 2021 01:26:30 -0700
In-Reply-To: <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
References: <20210602133659.46158-1-manikishanghantasala@gmail.com>
	 <9a3878fd-3b59-76f5-ddc7-625c66f9fee8@ieee.org>
	 <CAKzJ-FNW8EPX2oQd1qr5NagnvjtWwvSeuAh8DNLetj11+BJ6RA@mail.gmail.com>
	 <792dd57c0ef8454497e5ae4c4534dea2@AcuMS.aculab.com>
	 <e1c36fb4-ab72-0cce-f6fe-3f04125dae28@linaro.org>
	 <e23879ae78404be2b707b550b3029e43@AcuMS.aculab.com>
	 <10ad30e2-c906-b210-bf0e-5e20b6de1993@linaro.org>
	 <c29b5c97f97b48c894917647915bf510@AcuMS.aculab.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: AD175D1516
X-Spam-Status: No, score=-2.77
X-Stat-Signature: wjdyupwsx14pw579haxy5xkypixm9osy
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19fS19ixJkOAeDle8y0KO0ufAQmRER3gi0=
X-HE-Tag: 1622795191-465470

On Fri, 2021-06-04 at 08:13 +0000, David Laight wrote:
> From: Alex Elder
> > Sent: 03 June 2021 22:55
> ...
> > Not necessarily, sizeof(bool) is implementation defined.
> > And I thought you didn't think the size of the structure
> > was very important...
> 
> It is 'implementation defined' but will be 32 bits on everything
> except an old 32bit ARM ABI.

Really? (x86-64)

$ gcc -x c -
#include <stdio.h>
#include <stdlib.h>

struct foo {
	_Bool b;
};

int main(int argc, char **argv)
{
	printf("sizeof _Bool: %zu\n", sizeof(_Bool));
	printf("sizeof struct foo: %zu\n", sizeof(struct foo));
	return 0;
}
$ ./a.out
sizeof _Bool: 1
sizeof struct foo: 1


