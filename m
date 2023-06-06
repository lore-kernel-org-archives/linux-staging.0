Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0857137B71
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 14:28:55 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6261a25e9b6so50246966d6.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Jun 2023 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686061735; x=1688653735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWL9TIrPPXL5iMN2PMKfmz/IG3LdlvRosmbZV+NkrDo=;
        b=Vp0EzqeVhbKmKBEuFi1siWznTrf0iSbDTcmi3S994OnQu2m3UPcRsYKfX1G0i0ubUl
         jy0coySV6ZWx89tT9CHj6XSn/637wxMFIY5t4QsdDj27b1LHD4552wYSdH8o50foY2kP
         Fc8SLpIiZ17VTlx3WtKdpOvhOCDX0QDN78dluaffXpbzDbZh4oi/w/Q554a7Mpg20iWr
         iCTcW6f/t84frCulyguRpQGYK9bwrX3zPH23nF0gLySptcsP9Oeb70rfrAeohXbeiOwl
         Ad+78RffNt+EMfSYaapL/3WcIHNlxqCtl17NHgLnbVWxdeNEbTjppLiRpVboCRGbX7R7
         evsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061735; x=1688653735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWL9TIrPPXL5iMN2PMKfmz/IG3LdlvRosmbZV+NkrDo=;
        b=EkjfazVsJWZrj75dl6qtozFn7CQ1/ZdAJ7U7/lrixNzPzfocHaY6w150rj5kwvq/Co
         iSlhiUhGQeHjWYH4rOtbZmxOb7W0EHba1Too9A6dDGOgwdFbYQn94EL4x/wQubyJ1seH
         ARBG2jC8bLRSY56M5lRALQDHFprC0ar5ZtfU4Dw2+yOWqe3k5W1vOOzV8vcbFIrxdTd+
         62cXYjQoPK5MXJSrc8IRt6lEB7fGsD7se0kvojSqVMsjAR5L1O5E8xa8/joWio0qLEI3
         oxPeCepzCSupLSioeqvmZvuqtwRPCkMOrZmjQrCeMKXba/02FSBSyxcsUabt0dC/KCmt
         9+bg==
X-Gm-Message-State: AC+VfDwXuzgDkJ7WeJt85MpsQvh0Ia8+J+SswwxYO4zVd4h2t6lPluID
	TN+kjA7jamNW8B2/hwQ/So4JIEfIj4ncigrGfEA=
X-Google-Smtp-Source: ACHHUZ6IMo/9b+2gOvTRs51NN62pfdUiKh3o+2G8v9K9VPXnSeSAgJF/QsRpDrwL6nBwxCcxvLx/yoB+XhixH9UHCfM=
X-Received: by 2002:a05:6214:2627:b0:626:f3d:9e46 with SMTP id
 gv7-20020a056214262700b006260f3d9e46mr2682955qvb.18.1686061734700; Tue, 06
 Jun 2023 07:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230606133136.23619-1-hdegoede@redhat.com>
In-Reply-To: <20230606133136.23619-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 6 Jun 2023 17:28:18 +0300
Message-ID: <CAHp75VdxraOTMrxu_KxCzCKHNW8fiiqMRpaSQN3tVqiXAwGJWQ@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: csi2-bridge: Add support for setting
 "clock-" and "link-frequencies" props
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 6, 2023 at 4:31=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Some standard v4l2 sensor drivers from drivers/media/i2c expect a
> "clock-frequency" property on the device indicating the frequency
> of the extclk for the sensor. Example of such drivers are the
> ov2680 and ov5693 drivers.
>
> The standard ov5693 sensor also expects a "link-frequencies" property.
> Add support for setting both properties.
>
> Note the "clock-frequency" prop is added before the "rotation" prop while
> the "link-frequencies" are added at the end to match the ipu3 cio2-bridge
> code from which this is derived.

LGTM,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2.h    | 13 +++++++++----
>  .../staging/media/atomisp/pci/atomisp_csi2_bridge.c | 12 ++++++++++--
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.h b/drivers/s=
taging/media/atomisp/pci/atomisp_csi2.h
> index b389ccda5e98..16ddb3ab2963 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.h
> @@ -31,6 +31,7 @@
>  #define CSI2_PADS_NUM          2
>
>  #define CSI2_MAX_LANES         4
> +#define CSI2_MAX_LINK_FREQS    3
>
>  #define CSI2_MAX_ACPI_GPIOS    2u
>
> @@ -64,10 +65,12 @@ enum atomisp_csi2_sensor_swnodes {
>  };
>
>  struct atomisp_csi2_property_names {
> +       char clock_frequency[16];
>         char rotation[9];
>         char bus_type[9];
>         char data_lanes[11];
>         char remote_endpoint[16];
> +       char link_frequencies[17];
>  };
>
>  struct atomisp_csi2_node_names {
> @@ -79,6 +82,8 @@ struct atomisp_csi2_node_names {
>  struct atomisp_csi2_sensor_config {
>         const char *hid;
>         int lanes;
> +       int nr_link_freqs;
> +       u64 link_freqs[CSI2_MAX_LINK_FREQS];
>  };
>
>  struct atomisp_csi2_sensor {
> @@ -93,10 +98,10 @@ struct atomisp_csi2_sensor {
>         struct software_node swnodes[SWNODE_COUNT];
>         struct atomisp_csi2_node_names node_names;
>         struct atomisp_csi2_property_names prop_names;
> -       /* "rotation" + terminating entry */
> -       struct property_entry dev_properties[2];
> -       /* "bus-type", "data-lanes", "remote-endpoint" + terminating entr=
y */
> -       struct property_entry ep_properties[4];
> +       /* "clock-frequency", "rotation" + terminating entry */
> +       struct property_entry dev_properties[3];
> +       /* "bus-type", "data-lanes", "remote-endpoint" + "link-freq" + te=
rminating entry */
> +       struct property_entry ep_properties[5];
>         /* "data-lanes", "remote-endpoint" + terminating entry */
>         struct property_entry csi2_properties[3];
>         struct software_node_ref_args local_ref[1];
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/dr=
ivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 28d8779bbbc4..0d12ba78d9c1 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -85,7 +85,7 @@ static const guid_t atomisp_dsm_guid =3D
>
>  /*
>   * Extend this array with ACPI Hardware IDs of sensors known to be worki=
ng
> - * plus the number of links expected by their drivers.
> + * plus the default number of links + link-frequencies.
>   *
>   * Do not add an entry for a sensor that is not actually supported,
>   * or which have not yet been converted to work without atomisp_gmin
> @@ -492,10 +492,12 @@ static int atomisp_csi2_add_gpio_mappings(struct at=
omisp_csi2_sensor *sensor,
>  }
>
>  static const struct atomisp_csi2_property_names prop_names =3D {
> +       .clock_frequency =3D "clock-frequency",
>         .rotation =3D "rotation",
>         .bus_type =3D "bus-type",
>         .data_lanes =3D "data-lanes",
>         .remote_endpoint =3D "remote-endpoint",
> +       .link_frequencies =3D "link-frequencies",
>  };
>
>  static void atomisp_csi2_create_fwnode_properties(struct atomisp_csi2_se=
nsor *sensor,
> @@ -507,7 +509,9 @@ static void atomisp_csi2_create_fwnode_properties(str=
uct atomisp_csi2_sensor *se
>         sensor->local_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnodes=
[SWNODE_CSI2_ENDPOINT]);
>         sensor->remote_ref[0] =3D SOFTWARE_NODE_REFERENCE(&sensor->swnode=
s[SWNODE_SENSOR_ENDPOINT]);
>
> -       sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.rotation, 0);
> +       sensor->dev_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.clock_frequency,
> +                                                      PMC_CLK_RATE_19_2M=
HZ);
> +       sensor->dev_properties[1] =3D PROPERTY_ENTRY_U32(sensor->prop_nam=
es.rotation, 0);
>
>         sensor->ep_properties[0] =3D PROPERTY_ENTRY_U32(sensor->prop_name=
s.bus_type,
>                                                       V4L2_FWNODE_BUS_TYP=
E_CSI2_DPHY);
> @@ -516,6 +520,10 @@ static void atomisp_csi2_create_fwnode_properties(st=
ruct atomisp_csi2_sensor *se
>                                                                 sensor->l=
anes);
>         sensor->ep_properties[2] =3D PROPERTY_ENTRY_REF_ARRAY(sensor->pro=
p_names.remote_endpoint,
>                                                             sensor->local=
_ref);
> +       if (cfg->nr_link_freqs > 0)
> +               sensor->ep_properties[3] =3D
> +                       PROPERTY_ENTRY_U64_ARRAY_LEN(sensor->prop_names.l=
ink_frequencies,
> +                                                    cfg->link_freqs, cfg=
->nr_link_freqs);
>
>         sensor->csi2_properties[0] =3D PROPERTY_ENTRY_U32_ARRAY_LEN(senso=
r->prop_names.data_lanes,
>                                                                   bridge-=
>data_lanes,
> --
> 2.40.1
>


--=20
With Best Regards,
Andy Shevchenko
