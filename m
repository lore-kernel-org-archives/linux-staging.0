Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AC3FC1
	for <linux-staging@lists.linux.dev>; Thu,  2 Sep 2021 15:02:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="198690954"
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; 
   d="scan'208";a="198690954"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 08:02:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; 
   d="scan'208";a="689143989"
Received: from elee5-mobl.amr.corp.intel.com (HELO [10.212.50.6]) ([10.212.50.6])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2021 08:02:10 -0700
Subject: Re: config issue with SoundWire mockup device support
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Cc: tiwai@suse.com, perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
 Hans de Goede <hdegoede@redhat.com>, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
References: <20210902143632.GA1422@agape.jhs>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <10bb39d4-2560-4ceb-bf20-fe5a124142cb@linux.intel.com>
Date: Thu, 2 Sep 2021 10:02:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210902143632.GA1422@agape.jhs>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/2/21 9:36 AM, Fabio Aiuto wrote:
> Dear Pierre and all sound developers,
> 
> I work for some tests on a Lenovo ideapad Miix 300-10IBY,
> with fedora 34 workstation intalled on.
> After having pulled the last changes from staging tree I get
> the following issue by typing:
> 
> $ make olddefconfig
> 
> WARNING: unmet direct dependencies detected for SND_SOC_SDW_MOCKUP
>   Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m]
> 	&& EXPERT [=n] && SOUNDWIRE [=y]
>   Selected by [m]:
>   - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=m] && SOUND [=m] && !UML
> 	&& SND [=m] && SND_SOC [=m] && SND_SOC_INTEL_MACH [=y]
> 	&& SND_SOC_SOF_INTEL_SOUNDWIRE [=m] && I2C [=y] && ACPI [=y]
> 	&& GPIOLIB [=y] && (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n])
> 	&& (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST [=n])
> 	&& SOUNDWIRE [=y] && SND_HDA_CODEC_HDMI [=m] && SND_SOC_SOF_HDA_AUDIO_CODEC [=y]

It's a known issue that was reported and fixed by Nathan Chancellor:

[PATCH v2] ASoC: Intel: boards: Fix CONFIG_SND_SOC_SDW_MOCKUP select

https://lore.kernel.org/alsa-devel/20210802212409.3207648-1-nathan@kernel.org/

I'll ack the missing patch, thanks for reporting this.
