Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7BA46B7
	for <linux-staging@lists.linux.dev>; Sun, 16 Apr 2023 18:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681668077; i=markus.elfring@web.de;
	bh=vYC3rt9V2mTZ2sZnUeA8pQ/LU5bVw2JivRZjfpJX6fg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gDD2DtDPfmpxx19yV55dHJk0pQwMkeBqL793QBpndzFiO6hqc1Iy12WSZhjoMaYpu
	 SBqMtVFtjbZJCwJp/o+e3ITLbyIR+UFRrSUwr4iBH3I+kURdfzaNY4Lhw0fW+LRWw7
	 DGcZsnyTyhbWuhSEZfTgpWT5JVrsvXfpIZ3ACu2mI6yWzaikyeI4thVfcwN7gfOX/O
	 tA16RnZ3vWX6SHpDN4uskVoBSmsE+BeYbp+DGdJQuCSIn0p8vq64D3KbzIcO43uutd
	 ZpL3qQ4HyjD8/3ves/kmC/OTxxQrDFVppZXttZPCIgYhMuyLe5efLKreDSv24Z5rtu
	 k1kp8LBxgVUdA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MUCz1-1pxlJ13hJr-00RH45; Sun, 16
 Apr 2023 20:01:16 +0200
Message-ID: <435216c4-f9fc-57af-eecb-66f6f261badb@web.de>
Date: Sun, 16 Apr 2023 20:01:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, cocci@inria.fr,
 LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
 <ZDmJsemYldOsMMrH@smile.fi.intel.com>
 <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TCSYIG+iQi+PiDEJUC0TtW+MoN64yprk4Bdps0uHCtZiUpOC8WX
 9EVQoE1OfFWCzECc4guJ7LwWSW+nYPFtONMurVbQezn7nK11Nqru+KKjxxMlTVRkLjd31io
 l2JHLbcziho9EiYVI5QIHBZwzeTDiAWleYfuLJaw/EfdQnWLvAAQ21inIC+Ck0go/joknGe
 5PewtB5sIpQGx3b/C4hgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DMiA8dxln7A=;++9l2k1zCJod3YdOe5ixgx5c0zV
 uqipX9iX9WDVzAPYwKIAN/Joz8zbqGzcgh61eMKeOEsBEn6/J1Wl9gvdrNQ2JosssdVfDbez2
 YN+ukLiiQzvJKLGU1JT7OR1hOUhcuYqjVZbL01/VyJknEO3E+6GMU9GeRR1bVyunPpai3xkc9
 fXWPTYMMD3QmSUwhWxt8Woyhoyk9L+5OrrGn/TV2nIHONQfoipfIbv4yru9GyzEounX/vZOwm
 3xq55ND2oh1ZuVunrx3z33EOlGctSf6JVfL5hi+6OD8Xtgl+pp3DWbLV3Ao07UZO5lht1Gla+
 +8/QHQKLh/iYe6UGDZH1sHMHd2G7JYf2wqMn3BJhdorgcmTU+HBNEKKSN4Or8ywwNE+/ubJL/
 QODEY/SrPhRAysSLrpsGNaHvlsd1RnskXU7YR50/T5xSQDeCApPrhVKdSXb8Xjf/Wo9GR2yy5
 1yW6AiV4oYUKtQuk9sajU9PASTGIyaPLFyljoXjpNfUrTgTnaY/0Ng2m2zMdKg5T69l2gmEt9
 7t1bru8WXuUr8YS9HYu58bhcrku2qNH332RpYdBmJ9XTn/M9CRPR4FcIfcDKwS35GlYJJpmL+
 MFkCs7IjZcoyuA3XWb6FHs9kELe+sBent0oJ+jbz7UKm/zrpvpXsaLGsGf9gUnQgkFo3aT6Dp
 olAN1hwAZvj5BNDFbLm/6tuhjf3+i4wUAP4HfkGvck1tQlplNTCyJUXuiLeyfbo0YeL3kyisH
 gsKfO0E5LXTP0JTe8pfQHXrYjFyls9tn2FCg+9RnbNzne6ahZN4dyG6MwrTH2ysIy9IhsicEq
 SZq0AMI0GJcYntejBgrGam3lKRK3n9+NVegV2IEwHDI900pO3TZtJSN7WUXYxKjCciXcIHzpP
 9EVIA/+eNcqFGjD39QwpfEzGKnR9E4/n8k+sMbZD61NtZaKzFkIEjwJHN

> Instead of this patch, can you please audit the callers of this function=
?

Did any analysis tool publish a call tree already (according to your enqui=
ry)?
https://elixir.bootlin.com/linux/v6.3-rc6/source/drivers/staging/media/ato=
misp/pci/atomisp_cmd.c#L2721


> I expect that you will likely find that the callers
> already unconditionally deref css_param themselves, or they
> guarantee a non NULL value in other ways (e.g. address of
> local variable).
>
> So I expect that the check can simply be dropped completely,
> which would be a much better fix.

Are you really looking for ways to omit null pointer checks
for three input parameters here?

Would you like to increase the application of any annotations
or API attributes?

Regards,
Markus
