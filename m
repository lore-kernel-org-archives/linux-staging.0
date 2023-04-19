Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD72564
	for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 07:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681890579; i=markus.elfring@web.de;
	bh=x61/hqi5siQwZQsL/Fl+nfxphtZDih2eWXNncH6QJKM=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LpJhpkF/e8iHZXvJNh7loGHayrMHhsleBiwLkNC5GpcKOIqMhUoc4rfEgIRfh/75j
	 l8EWSV2GIQSYV/zLDjbRo6UKh1jZYjV9UjCLldMPeFnuwatn83hSE69+0V7vPCxG/2
	 AGS5R0o/IvC7LC/P1l+YDZTGOlt+PhtszBam1ncSOXsx89Rg0xl7gEAQV7goSCsHzf
	 BkC36K6O2NlyPqZVJliXLjp4LEnuqGR7BMytRWQCLTQ8gPSD3xfVN8ecesSgNrwKuS
	 19dGPfx4zUuT2coFfQMuxBrmMLFKNqQJMJW88zwMg4wCW3et6q8D1EVHMBf58b/OJn
	 LFokeQm7C/zRQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHEbk-1pbrIB1htw-00DemS; Wed, 19
 Apr 2023 09:49:39 +0200
Message-ID: <a858402e-c733-bf31-4955-82cbb2417ab1@web.de>
Date: Wed, 19 Apr 2023 09:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: media: atomisp: Move a variable assignment behind a null pointer
 check in atomisp_cp_general_isp_parameters()
Content-Language: en-GB
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
 <ZDmJsemYldOsMMrH@smile.fi.intel.com>
 <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TV8gDFo1TnZt3B98WD6A6w6dKaFDyinWNbl/mR8s9XB5zgwMT9I
 4qmzOJCnx8/wMb9gtny28ULPbXeHlh4KOwDup+IQolbc67yiKmkWwBDiDASlXiUMBhZ+x1T
 OtWg3ZXCEkhC+8Y5w8B1cAnX7TThBzDeRQG0AouM7VCThmTjDVeoe7kUlKRO2VGAKO0xJUn
 2/NVHn5wzv7GhAj8TyM/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EJW0Jc56o2o=;4o0Y7odLzLJd7t+EIXXb4PORwCF
 ySceqoteVgGfHSYnlEdnpV31W2ADWWOvwUpQdOD0xf4P7RKAFr8o+XxcmMzvdHY8ukDYBdlnE
 DKHl4M8t07Rsh2Uo4w1az5xLzKFrUR4xOmcBD46JaG5UJqeFExD2ATSTJD8K0z73VFr14e/Ez
 oOEOllm8ptElGM3oletrSRJqHQSHNPqyBXstqurBUJ3I9+2GDz1YrzOBDC3CBHkCOnz7yXF3p
 ksIft/hxLFhdMHFRyFcK22hXRuIEQuYHrRMfQLhdbZ8tA81CVNSw/TXHbMX0+u+UyPCHfDwbS
 uy4i/IRuIj9Y9VEAMmDBJq2poTDvTgD2eVrEWscQ9RmOPOS4YtqShIm9arkkEW8EUapDSKyMc
 QJ6O2N+VOx2t2pyUUsydTU8gRBxcIVj/FYOzijYrN+ydshK4q9W8PN+ks5XCZ49u3OBBTbOdu
 8s//eTM9HE8XX70+tdhpbX7PaGLXr0IsaGhI44TmY3Jsg4UXKNSFT6Tlmx+N2cNojMBYNiSQ9
 +Cd/76puAGjNJSVKKdgilKP4bQyv1D9z39ZUmRP9APLpO9ukoyJ/JpLoZ5dcKgU2N6mcJpwm4
 zw1wmhhUMZBdkWm98+IDIXawfc0hSukoZNAWsdhb3/qbhZmzk4UJaK4tROubuHB+JB8OB8fu2
 VEaSP2Zbd6zUmV7Truj/oWunuoEX1Lda3mJ/6KRd6ionF0mFk2y8/ijkrKnrlxvGUoJ6KU0y5
 HkZj/f5wxdoaIkZKjGDZ9WoktjY+csY3HIMjOqQ2nmMc6/0Lwn0MlugRzvgczz6SJoY6wCN2a
 lGsWsvwfbUjh7yXmhHW9WGwD7mEyY/uJ0HxKWXbw5zJ7lZjoz5GhSe/xLIAK/41eVUBsKWt0q
 vpW88hftH4Ts5kZnATHZSZCI+A30U+5L8fjtls+o0IsLft8pGq/mREwCb

> Instead of this patch, can you please audit the callers of this function=
?

How will the determination evolve further if null pointer checks would be =
still
relevant for three input parameters according to this function implementat=
ion
at the moment?
https://elixir.bootlin.com/linux/v6.3-rc7/source/drivers/staging/media/ato=
misp/pci/atomisp_cmd.c#L2721


> I expect that you will likely find that the callers
> already unconditionally deref css_param themselves,
> or they guarantee a non NULL value in other ways
> (e.g. address of local variable).
>
> So I expect that the check can simply be dropped completely,
> which would be a much better fix.

Will affected implementation details be reconsidered any more?

Regards,
Markus
