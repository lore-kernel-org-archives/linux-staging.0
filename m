Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E4023AD
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 09:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64136C4339B;
	Wed, 22 Mar 2023 09:29:46 +0000 (UTC)
Message-ID: <eb09f4a7-f923-3f5f-ec95-0d07668ee275@xs4all.nl>
Date: Wed, 22 Mar 2023 10:29:44 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH v4 00/21] Add Tegra20 parallel video input capture
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230322101417.4561a7ae@booty>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230322101417.4561a7ae@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 10:14, Luca Ceresoli wrote:
> Hello,
> 
> On Thu,  9 Mar 2023 15:42:59 +0100
> Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> 
>> TL;DR: Resending this series with Rob's review tag added. Now all DT
>> patches have at least a reviewed-by tag from Rob or Krzysztof, all the
>> driver patches have one from Dmitry.
> 
> This is a gentle ping about this series. All patches have a
> reviewed-by, there are no major changes since v2, and it's touching a
> staging driver anyway.
> 
> I don't think there is more I can do at the moment besides pinging, but
> should there be anything, I'd be glad to know! :-)

I actually started on this last week, but now I am abroad again with no
hardware access.

I hope I can resume work on it next week, because after that I am again
abroad for 10 days or so.

It's currently very high on my todo list, so I really hope I will be able
to make progress on it next week.

Regards,

	Hans
