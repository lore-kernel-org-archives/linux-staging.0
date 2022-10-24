Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302D809
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 11:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC90CC433D6;
	Mon, 24 Oct 2022 11:01:45 +0000 (UTC)
Message-ID: <05bba2ef-b47a-fe00-fe0b-8a6e375ab586@xs4all.nl>
Date: Mon, 24 Oct 2022 13:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 13/14] staging: media: remove davinci vpfe_capture driver
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20221019152947.3857217-1-arnd@kernel.org>
 <20221019152947.3857217-14-arnd@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221019152947.3857217-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd,

On 10/19/22 17:29, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver was for the davinci dm644x and dm3xx platforms that are
> now removed from the kernel, so there are no more users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

As discussed on irc, it is best if you merge this to due dependencies on
arch/arm/mach-davinci/davinci.h.

Note that there is one more reference to vpfe_capture.h:

Documentation/userspace-api/ioctl/ioctl-number.rst:'V'   C0     media/davinci/vpfe_capture.h                            conflict!

Feel free to fold that in this patch, or make a separate patch removing it.
If you make a separate patch, then you can add my Acked-by for that change.

Regards,

	Hans
